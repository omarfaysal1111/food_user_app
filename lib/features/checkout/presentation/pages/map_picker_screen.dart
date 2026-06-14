import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/keyboard_dismiss_on_tap.dart';
import 'package:food_user_app/features/checkout/domain/entities/map_picker_result.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
    this.initialAddress,
    this.mode = MapPickerMode.select,
  });

  factory MapPickerScreen.fromArgs(MapPickerArgs args) {
    return MapPickerScreen(
      initialLatitude: args.initialLatitude,
      initialLongitude: args.initialLongitude,
      initialAddress: args.initialAddress,
      mode: args.mode,
    );
  }

  final double? initialLatitude;
  final double? initialLongitude;
  final String? initialAddress;
  final MapPickerMode mode;

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  static const _fallbackLatLng = LatLng(30.0444, 31.2357);
  static const _loadingAddress = 'جاري تحديد العنوان...';
  static const _fallbackAddress = 'موقع محدد على الخريطة';
  static const _failedAddress = 'تعذر تحديد العنوان';
  static const _googleWebServicesApiKey =
      'AIzaSyDyHQEAjWa8vsCZa6Fe71DG2ej8x6sjPaE';

  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  GoogleMapController? _mapController;
  Timer? _searchDebounce;
  LatLng _selectedLatLng = _fallbackLatLng;
  String _selectedAddress = _loadingAddress;
  bool _isResolvingAddress = false;
  bool _isSearching = false;
  List<_PlacePrediction> _predictions = const [];

  @override
  void initState() {
    super.initState();
    _selectedLatLng =
        (widget.initialLatitude != null && widget.initialLongitude != null)
        ? LatLng(widget.initialLatitude!, widget.initialLongitude!)
        : _fallbackLatLng;
    _selectedAddress = widget.initialAddress?.trim().isNotEmpty == true
        ? widget.initialAddress!.trim()
        : _loadingAddress;
    unawaited(_initializeCurrentLocation());
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final addressText = _isResolvingAddress
        ? _loadingAddress
        : _selectedAddress;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldBackground(context),
      body: KeyboardDismissOnTap(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                child: _MapHeader(title: l10n.chooseLocation),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _SearchLocationField(
                        label: l10n.searchForAddress,
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        onChanged: _onSearchChanged,
                        isLoading: _isSearching,
                      ),
                      _PredictionsList(
                        predictions: _predictions,
                        onSelected: _selectPrediction,
                      ),
                      const SizedBox(height: 12),
                      _MapPreview(
                        initialLatLng: _selectedLatLng,
                        onMapCreated: _onMapCreated,
                        onCameraMove: _onCameraMove,
                        onCameraIdle: _onCameraIdle,
                      ),
                      const SizedBox(height: 16),
                      _SelectedLocationRow(text: addressText),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              _BottomBar(label: l10n.confirmLocation, onTap: _confirmLocation),
            ],
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    unawaited(
      controller.moveCamera(CameraUpdate.newLatLngZoom(_selectedLatLng, 14)),
    );
    if (widget.initialAddress?.trim().isNotEmpty != true) {
      unawaited(_reverseGeocodeSelectedLocation());
    }
  }

  Future<void> _initializeCurrentLocation() async {
    final hasInitialLocation =
        widget.initialLatitude != null && widget.initialLongitude != null;
    if (hasInitialLocation) {
      await _moveCameraTo(_selectedLatLng);
      if (widget.initialAddress?.trim().isNotEmpty != true) {
        await _reverseGeocodeSelectedLocation();
      }
      return;
    }

    if (!mounted) return;
    setState(() {
      _selectedLatLng = _fallbackLatLng;
      _selectedAddress = _loadingAddress;
      _isResolvingAddress = true;
    });

    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await _useFallbackLocation();
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await _useFallbackLocation();
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      if (!mounted) return;

      final currentLatLng = LatLng(position.latitude, position.longitude);
      setState(() => _selectedLatLng = currentLatLng);
      await _moveCameraTo(currentLatLng);
      await _reverseGeocodeSelectedLocation();
    } catch (_) {
      await _useFallbackLocation();
    }
  }

  Future<void> _useFallbackLocation() async {
    if (!mounted) return;
    setState(() => _selectedLatLng = _fallbackLatLng);
    await _moveCameraTo(_fallbackLatLng);
    await _reverseGeocodeSelectedLocation();
  }

  Future<void> _moveCameraTo(LatLng latLng) async {
    final controller = _mapController;
    if (controller == null) return;
    await controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));
  }

  void _onCameraMove(CameraPosition position) {
    if (!mounted) return;
    setState(() {
      _selectedLatLng = position.target;
      _isResolvingAddress = true;
    });
  }

  void _onCameraIdle() {
    unawaited(_reverseGeocodeSelectedLocation());
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    final query = value.trim();
    if (query.isEmpty) {
      setState(() {
        _predictions = const [];
        _isSearching = false;
      });
      return;
    }

    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      unawaited(_searchPlaces(query));
    });
  }

  Future<void> _searchPlaces(String query) async {
    if (!mounted) return;
    setState(() => _isSearching = true);

    try {
      final uri = Uri.https(
        'maps.googleapis.com',
        '/maps/api/place/autocomplete/json',
        {
          'input': query,
          'language': 'ar',
          'components': 'country:eg',
          'key': _googleWebServicesApiKey,
        },
      );
      final response = await http.get(uri);
      if (!mounted) return;

      final body = jsonDecode(response.body);
      if (response.statusCode != 200 || body is! Map<String, dynamic>) {
        _debugGoogleApiFailure(
          'Places autocomplete',
          status: null,
          errorMessage: null,
          httpStatusCode: response.statusCode,
        );
        setState(() {
          _predictions = const [];
          _isSearching = false;
        });
        return;
      }

      final status = body['status'] as String?;
      final errorMessage = body['error_message'] as String?;
      if (status != 'OK' && status != 'ZERO_RESULTS') {
        _debugGoogleApiFailure(
          'Places autocomplete',
          status: status,
          errorMessage: errorMessage,
          httpStatusCode: response.statusCode,
        );
        setState(() {
          _predictions = const [];
          _isSearching = false;
        });
        return;
      }

      final rawPredictions = body['predictions'];
      final predictions = rawPredictions is List
          ? rawPredictions
                .whereType<Map<String, dynamic>>()
                .map(_PlacePrediction.fromJson)
                .where((prediction) => prediction.placeId.isNotEmpty)
                .toList()
          : <_PlacePrediction>[];

      setState(() {
        _predictions = predictions;
        _isSearching = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _predictions = const [];
        _isSearching = false;
      });
    }
  }

  Future<void> _selectPrediction(_PlacePrediction prediction) async {
    _searchDebounce?.cancel();
    _searchFocusNode.unfocus();
    _searchController.text = prediction.description;
    setState(() {
      _predictions = const [];
      _selectedAddress = prediction.description;
      _isResolvingAddress = true;
    });

    try {
      final uri =
          Uri.https('maps.googleapis.com', '/maps/api/place/details/json', {
            'place_id': prediction.placeId,
            'fields': 'geometry,formatted_address,name',
            'language': 'ar',
            'key': _googleWebServicesApiKey,
          });
      final response = await http.get(uri);
      if (!mounted) return;

      final body = jsonDecode(response.body);
      final status = body is Map<String, dynamic>
          ? body['status'] as String?
          : null;
      final errorMessage = body is Map<String, dynamic>
          ? body['error_message'] as String?
          : null;
      if (response.statusCode != 200 ||
          body is! Map<String, dynamic> ||
          status != 'OK') {
        _debugGoogleApiFailure(
          'Place details',
          status: status,
          errorMessage: errorMessage,
          httpStatusCode: response.statusCode,
        );
        setState(() => _isResolvingAddress = false);
        return;
      }

      final result = body['result'] as Map<String, dynamic>?;
      final geometry = result?['geometry'] as Map<String, dynamic>?;
      final location = geometry?['location'] as Map<String, dynamic>?;
      final lat = (location?['lat'] as num?)?.toDouble();
      final lng = (location?['lng'] as num?)?.toDouble();
      if (lat == null || lng == null) {
        _debugGoogleApiFailure(
          'Place details',
          status: status,
          errorMessage: errorMessage,
          httpStatusCode: response.statusCode,
        );
        setState(() => _isResolvingAddress = false);
        return;
      }

      final nextLatLng = LatLng(lat, lng);
      final nextAddress =
          (result?['formatted_address'] as String?)?.trim().isNotEmpty == true
          ? (result!['formatted_address'] as String).trim()
          : prediction.description;

      setState(() {
        _selectedLatLng = nextLatLng;
        _selectedAddress = nextAddress;
        _isResolvingAddress = false;
      });

      await _moveCameraTo(nextLatLng);
    } catch (_) {
      if (!mounted) return;
      setState(() => _isResolvingAddress = false);
    }
  }

  Future<void> _reverseGeocodeSelectedLocation() async {
    final latLng = _selectedLatLng;
    if (!mounted) return;
    setState(() => _isResolvingAddress = true);

    try {
      final uri = Uri.https('maps.googleapis.com', '/maps/api/geocode/json', {
        'latlng': '${latLng.latitude},${latLng.longitude}',
        'language': 'ar',
        'key': _googleWebServicesApiKey,
      });
      final response = await http.get(uri);
      if (!mounted) return;

      final body = jsonDecode(response.body);
      if (response.statusCode != 200 || body is! Map<String, dynamic>) {
        _debugGoogleApiFailure(
          'Geocoding',
          status: null,
          errorMessage: null,
          httpStatusCode: response.statusCode,
        );
        setState(() {
          _selectedAddress = _failedAddress;
          _isResolvingAddress = false;
        });
        return;
      }

      final status = body['status'] as String?;
      final errorMessage = body['error_message'] as String?;
      if (status != 'OK' && status != 'ZERO_RESULTS') {
        _debugGoogleApiFailure(
          'Geocoding',
          status: status,
          errorMessage: errorMessage,
          httpStatusCode: response.statusCode,
        );
        setState(() {
          _selectedAddress = _failedAddress;
          _isResolvingAddress = false;
        });
        return;
      }

      final results = body['results'];
      String? address;
      if (results is List && results.isNotEmpty) {
        final firstResult = results.first;
        if (firstResult is Map<String, dynamic>) {
          address = firstResult['formatted_address'] as String?;
        }
      }

      setState(() {
        _selectedAddress = address?.trim().isNotEmpty == true
            ? address!.trim()
            : _fallbackAddress;
        _isResolvingAddress = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _selectedAddress = _failedAddress;
        _isResolvingAddress = false;
      });
    }
  }

  void _debugGoogleApiFailure(
    String apiName, {
    required String? status,
    required String? errorMessage,
    required int httpStatusCode,
  }) {
    if (!kDebugMode) return;
    debugPrint(
      '$apiName failed: status=$status, error=$errorMessage, '
      'http=$httpStatusCode',
    );
  }

  void _confirmLocation() {
    context.pop(
      MapPickerResult(
        latitude: _selectedLatLng.latitude,
        longitude: _selectedLatLng.longitude,
        address: _selectedAddress.isEmpty ? _fallbackAddress : _selectedAddress,
      ),
    );
  }
}

class _PlacePrediction {
  const _PlacePrediction({required this.placeId, required this.description});

  factory _PlacePrediction.fromJson(Map<String, dynamic> json) {
    return _PlacePrediction(
      placeId: json['place_id'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );
  }

  final String placeId;
  final String description;
}

class _MapHeader extends StatelessWidget {
  const _MapHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.pop(),
              child: SizedBox(
                width: 28,
                height: 28,
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 28,
                  color: AppColors.onSurface(context),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.appBarTitle(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchLocationField extends StatelessWidget {
  const _SearchLocationField({
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.isLoading,
  });

  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.addressSearchIcon,
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(
              AppColors.paragraph(context),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.search,
              cursorColor: AppColors.cursor(context),
              style: AppTextStyles.inputText(
                context,
              ).copyWith(fontSize: 12, height: 1.3),
              decoration: InputDecoration(
                hintText: label,
                hintStyle: AppTextStyles.caption(context).copyWith(
                  color: AppColors.paragraph(context),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsetsDirectional.zero,
              ),
            ),
          ),
          if (isLoading)
            SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.paragraph(context),
              ),
            ),
        ],
      ),
    );
  }
}

class _PredictionsList extends StatelessWidget {
  const _PredictionsList({required this.predictions, required this.onSelected});

  final List<_PlacePrediction> predictions;
  final ValueChanged<_PlacePrediction> onSelected;

  @override
  Widget build(BuildContext context) {
    if (predictions.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsetsDirectional.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.zero,
        itemCount: predictions.length,
        separatorBuilder: (_, _) => Divider(
          height: 1,
          thickness: 0.5,
          color: AppColors.border(context),
        ),
        itemBuilder: (context, index) {
          final prediction = predictions[index];
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onSelected(prediction),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Text(
                prediction.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: AppTextStyles.caption(context).copyWith(
                  color: AppColors.onSurface(context),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview({
    required this.initialLatLng,
    required this.onMapCreated,
    required this.onCameraMove,
    required this.onCameraIdle,
  });

  final LatLng initialLatLng;
  final ValueChanged<GoogleMapController> onMapCreated;
  final CameraPositionCallback onCameraMove;
  final VoidCallback onCameraIdle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 469,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialLatLng,
                zoom: 14,
              ),
              onMapCreated: onMapCreated,
              onCameraMove: onCameraMove,
              onCameraIdle: onCameraIdle,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
            ),
            IgnorePointer(
              child: SvgPicture.asset(
                AppAssets.addressLocationIcon,
                width: 32,
                height: 32,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedLocationRow extends StatelessWidget {
  const _SelectedLocationRow({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.addressLocationIcon,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            maxLines: null,
            overflow: TextOverflow.visible,
            softWrap: true,
            textAlign: TextAlign.start,
            style: AppTextStyles.footerSecondary(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, bottomSafe + 20),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: AppTextStyles.primaryButtonLabel.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
        ),
      ),
    );
  }
}
