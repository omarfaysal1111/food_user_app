import 'dart:ui';

class SavedAddress {
  const SavedAddress({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.detailsAr,
    required this.detailsEn,
    required this.locationAr,
    required this.locationEn,
    required this.latitude,
    required this.longitude,
  });

  final String id;
  final String titleAr;
  final String titleEn;
  final String detailsAr;
  final String detailsEn;
  final String locationAr;
  final String locationEn;
  final double latitude;
  final double longitude;

  String title(Locale locale) => _localized(locale, ar: titleAr, en: titleEn);

  String details(Locale locale) =>
      _localized(locale, ar: detailsAr, en: detailsEn);

  String location(Locale locale) =>
      _localized(locale, ar: locationAr, en: locationEn);

  String shortLocation(Locale locale) {
    final parts = location(locale)
        .split(RegExp(r'،|,'))
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.length >= 2) {
      return parts
          .sublist(parts.length - 2)
          .join(locale.languageCode == 'ar' ? '، ' : ', ');
    }
    return location(locale);
  }

  SavedAddress copyWith({
    String? titleAr,
    String? titleEn,
    String? detailsAr,
    String? detailsEn,
    String? locationAr,
    String? locationEn,
    double? latitude,
    double? longitude,
  }) {
    return SavedAddress(
      id: id,
      titleAr: titleAr ?? this.titleAr,
      titleEn: titleEn ?? this.titleEn,
      detailsAr: detailsAr ?? this.detailsAr,
      detailsEn: detailsEn ?? this.detailsEn,
      locationAr: locationAr ?? this.locationAr,
      locationEn: locationEn ?? this.locationEn,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  static String _localized(
    Locale locale, {
    required String ar,
    required String en,
  }) {
    return locale.languageCode == 'ar' ? ar : en;
  }
}
