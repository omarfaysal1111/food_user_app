import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/features/order/presentation/pages/order_detail_screen.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  static const _screenPadding = 16.0;
  static const _cardRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final orders = _OrderCardData.samples(l10n);

    return ColoredBox(
      color: AppColors.scaffoldBackground(context),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              _screenPadding,
              20,
              _screenPadding,
              0,
            ),
            sliver: SliverToBoxAdapter(
              child: _OrdersHeader(title: l10n.ordersTitle),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              _screenPadding,
              20,
              _screenPadding,
              24,
            ),
            sliver: SliverList.separated(
              itemCount: orders.length,
              itemBuilder: (context, index) => _OrderCard(order: orders[index]),
              separatorBuilder: (_, _) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrdersHeader extends StatelessWidget {
  const _OrdersHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.heading4(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // TODO: Open notifications from Orders once tab-level actions are finalized.
            },
            child: Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surfaceCard(context),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.border(context),
                  width: 0.5,
                ),
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
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final _OrderCardData order;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _openOrderDetails(context),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackground(context),
          borderRadius: BorderRadius.circular(OrderHistoryScreen._cardRadius),
          border: Border.all(color: AppColors.border(context), width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _OrderCardTopRow(order: order),
            Divider(
              height: 17,
              thickness: 0.5,
              color: AppColors.border(context),
            ),
            _OrderStatusRow(order: order),
            if (order.progressStep != null) ...[
              const SizedBox(height: 16),
              _OrderProgressBar(activeStep: order.progressStep!),
            ],
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _OrderBadge(label: order.badgeLabel, muted: order.isClosed),
                _PrimaryActionButton(
                  label: l10n.orderDetails,
                  onTap: () => _openOrderDetails(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openOrderDetails(BuildContext context) {
    context.push(
      RouteNames.orderDetail.replaceFirst(':id', 'design'),
      extra: order.detailsStatus,
    );
  }
}

class _OrderCardTopRow extends StatelessWidget {
  const _OrderCardTopRow({required this.order});

  final _OrderCardData order;

  @override
  Widget build(BuildContext context) {
    final restaurantGroup = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: Image.asset(
            AppAssets.orderRestaurantAvatar,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          order.restaurantName,
          style: AppTextStyles.textLink(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.25,
          ),
        ),
      ],
    );

    final priceGroup = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          order.totalLabel,
          style: AppTextStyles.body(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
        const SizedBox(width: 6),
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          order.productsLabel,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [restaurantGroup, priceGroup],
    );
  }
}

class _OrderStatusRow extends StatelessWidget {
  const _OrderStatusRow({required this.order});

  final _OrderCardData order;

  @override
  Widget build(BuildContext context) {
    final showEta = order.progressStep != null;

    final statusGroup = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _OrderStatusIcon(cancelled: order.cancelled),
        const SizedBox(width: 8),
        SizedBox(
          width: 151,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.shortStatusLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: AppTextStyles.caption(context).copyWith(
                  color: order.statusColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                order.statusLabel,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: AppTextStyles.body(context).copyWith(
                  color: AppColors.onSurface(context),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final etaGroup = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          order.etaTitle,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.paragraph(context),
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          order.etaValue,
          style: AppTextStyles.body(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
      ],
    );

    return Row(
      mainAxisAlignment: showEta
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [statusGroup, if (showEta) etaGroup],
    );
  }
}

class _OrderStatusIcon extends StatelessWidget {
  const _OrderStatusIcon({required this.cancelled});

  final bool cancelled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        cancelled
            ? AppAssets.orderTornReceiptIcon
            : AppAssets.orderReceiptRollIcon,
        width: 30,
        height: 30,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _OrderProgressBar extends StatelessWidget {
  const _OrderProgressBar({required this.activeStep});

  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < 4; index++) ...[
          Expanded(
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: index <= activeStep
                    ? AppColors.primary
                    : AppColors.border(context).withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          if (index != 3) const SizedBox(width: 4),
        ],
      ],
    );
  }
}

class _PrimaryActionButton extends StatelessWidget {
  const _PrimaryActionButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 132,
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
    );
  }
}

class _OrderBadge extends StatelessWidget {
  const _OrderBadge({required this.label, required this.muted});

  final String label;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.border(context).withValues(alpha: muted ? 0.35 : 0.55),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: AppTextStyles.caption(context).copyWith(
          color: muted
              ? AppColors.paragraph(context)
              : AppColors.onSurface(context),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
      ),
    );
  }
}

class _OrderCardData {
  const _OrderCardData({
    required this.restaurantName,
    required this.totalLabel,
    required this.productsLabel,
    required this.etaTitle,
    required this.etaValue,
    required this.shortStatusLabel,
    required this.statusLabel,
    required this.badgeLabel,
    required this.statusColor,
    required this.isClosed,
    required this.detailsStatus,
    this.progressStep,
    this.cancelled = false,
  });

  final String restaurantName;
  final String totalLabel;
  final String productsLabel;
  final String etaTitle;
  final String etaValue;
  final String shortStatusLabel;
  final String statusLabel;
  final String badgeLabel;
  final Color statusColor;
  final bool isClosed;
  final OrderDetailsStatus detailsStatus;
  final int? progressStep;
  final bool cancelled;

  static List<_OrderCardData> samples(AppLocalizations l10n) {
    return [
      _OrderCardData(
        restaurantName: l10n.orderRestaurantAzAlSham,
        totalLabel: l10n.orderTotal,
        productsLabel: l10n.orderProductsCount,
        etaTitle: l10n.orderEstimatedArrival,
        etaValue: l10n.orderEstimatedArrivalRange,
        shortStatusLabel: l10n.orderWaitingAcceptanceShort,
        statusLabel: l10n.orderWaitingAcceptance,
        badgeLabel: l10n.reorder,
        statusColor: const Color(0xFFEFBE1C),
        isClosed: false,
        detailsStatus: OrderDetailsStatus.waitingAcceptance,
        progressStep: 0,
      ),
      _OrderCardData(
        restaurantName: l10n.orderRestaurantAzAlSham,
        totalLabel: l10n.orderTotal,
        productsLabel: l10n.orderProductsCount,
        etaTitle: l10n.orderEstimatedArrival,
        etaValue: l10n.orderEstimatedArrivalRange,
        shortStatusLabel: l10n.orderPreparingShort,
        statusLabel: l10n.orderPreparing,
        badgeLabel: l10n.reorder,
        statusColor: AppColors.primary,
        isClosed: false,
        detailsStatus: OrderDetailsStatus.preparing,
        progressStep: 1,
      ),
      _OrderCardData(
        restaurantName: l10n.orderRestaurantAzAlSham,
        totalLabel: l10n.orderTotal,
        productsLabel: l10n.orderProductsCount,
        etaTitle: l10n.orderEstimatedArrival,
        etaValue: l10n.orderEstimatedArrivalRange,
        shortStatusLabel: l10n.orderCourierOnWayShort,
        statusLabel: l10n.orderCourierOnWay,
        badgeLabel: l10n.reorder,
        statusColor: AppColors.primary,
        isClosed: false,
        detailsStatus: OrderDetailsStatus.courierOnWay,
        progressStep: 2,
      ),
      _OrderCardData(
        restaurantName: l10n.orderRestaurantAzAlSham,
        totalLabel: l10n.orderTotal,
        productsLabel: l10n.orderProductsCount,
        etaTitle: l10n.orderEstimatedArrival,
        etaValue: l10n.orderEstimatedArrivalRange,
        shortStatusLabel: l10n.orderDeliveredShort,
        statusLabel: l10n.orderDelivered,
        badgeLabel: l10n.orderDeliveredShort,
        statusColor: const Color(0xFFA7A7A7),
        isClosed: true,
        detailsStatus: OrderDetailsStatus.delivered,
      ),
      _OrderCardData(
        restaurantName: l10n.orderRestaurantAzAlSham,
        totalLabel: l10n.orderTotal,
        productsLabel: l10n.orderProductsCount,
        etaTitle: l10n.orderEstimatedArrival,
        etaValue: l10n.orderEstimatedArrivalRange,
        shortStatusLabel: l10n.orderCancelledShort,
        statusLabel: l10n.orderCancelled,
        badgeLabel: l10n.orderCancelledShort,
        statusColor: AppColors.error,
        isClosed: true,
        detailsStatus: OrderDetailsStatus.cancelled,
        cancelled: true,
      ),
    ];
  }
}
