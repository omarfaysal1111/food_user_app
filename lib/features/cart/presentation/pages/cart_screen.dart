import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:food_user_app/features/cart/presentation/widgets/cart_summary.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> _items;
  var _seededMockItems = false;

  @override
  void initState() {
    super.initState();
    _items = const [];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (!_seededMockItems) {
      _items = _mockItems(l10n);
      _seededMockItems = true;
    }

    final subtotal = _items.fold<int>(
      0,
      (total, item) => total + (item.price * item.quantity),
    );
    const delivery = 20;
    const discount = 80;
    final total = subtotal + delivery - discount;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
              sliver: SliverToBoxAdapter(child: _CartHeader(l10n: l10n)),
            ),
            SliverPadding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 28, 16, 0),
              sliver: SliverList.separated(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return CartItemTile(
                    item: item,
                    onEdit: () => _openProductDetails(item),
                    onIncrement: () => _changeQuantity(index, 1),
                    onDecrement: () => _changeQuantity(index, -1),
                  );
                },
                separatorBuilder: (_, _) => Divider(
                  height: 32,
                  thickness: 0.5,
                  color: AppColors.border(context),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CartSummary(
                subtotal: subtotal,
                delivery: delivery,
                discount: discount,
                total: total,
                onCheckout: () {
                  // TODO: Connect checkout once cart API integration is ready.
                  context.push(RouteNames.checkout);
                },
                onAddMore: () {
                  // TODO: Navigate to restaurant menu when real cart source is wired.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeQuantity(int index, int delta) {
    setState(() {
      final current = _items[index];
      final nextQuantity = (current.quantity + delta).clamp(0, 99);
      if (nextQuantity == 0) {
        _items.removeAt(index);
      } else {
        _items[index] = current.copyWith(quantity: nextQuantity);
      }
    });
    // TODO: Persist quantity changes through the cart API.
  }

  void _openProductDetails(CartItem item) {
    context.push(RouteNames.productDetails, extra: item);
  }

  List<CartItem> _mockItems(AppLocalizations l10n) {
    // TODO: Replace local mock cart data with real cart API response.
    return [
      CartItem(
        id: 'burger-combo-1',
        name: l10n.cartProductBurgerCombo,
        description: l10n.productBurgerDescription,
        price: 200,
        imageAsset: AppAssets.cartProductImage,
      ),
      CartItem(
        id: 'burger-combo-2',
        name: l10n.cartProductBurgerCombo,
        description: l10n.productBurgerDescription,
        price: 200,
        imageAsset: AppAssets.cartProductImage,
      ),
    ];
  }
}

class _CartHeader extends StatelessWidget {
  const _CartHeader({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.cartTitle,
              textAlign: TextAlign.start,
              style: AppTextStyles.heading4(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
            _NotificationButton(
              onTap: () => context.push(RouteNames.notifications),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          l10n.cartRestaurantSubtitle,
          textAlign: TextAlign.start,
          style: AppTextStyles.textLink(context).copyWith(
            color: AppColors.paragraph(context),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard(context),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border(context), width: 0.5),
        ),
        child: SvgPicture.asset(
          AppAssets.mainNotification,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
