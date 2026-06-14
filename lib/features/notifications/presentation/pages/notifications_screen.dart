import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const _showEmptyState = true;

  static const _screenPadding = 16.0;
  static const _topInset = 20.0;
  static const _headerHeight = 28.0;
  static const _headerIconSize = 28.0;
  static const _headerGap = 4.0;
  static const _contentTopGap = 20.0;
  static const _cardGap = 12.0;
  static const _cardRadius = 10.0;
  static const _iconContainerSize = 44.0;
  static const _iconSize = 22.0;

  List<_LocalNotification> _notifications(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      _LocalNotification(
        icon: Icons.shopping_bag_outlined,
        iconColor: AppColors.primary,
        title: l10n.notificationOrderTitle,
        body: l10n.notificationOrderMessage,
        time: l10n.notificationTimeNow,
        isRead: false,
      ),
      _LocalNotification(
        icon: Icons.local_offer_outlined,
        iconColor: AppColors.success,
        title: l10n.notificationOfferTitle,
        body: l10n.notificationOfferMessage,
        time: l10n.notificationSampleTime,
        isRead: false,
      ),
      _LocalNotification(
        icon: Icons.notifications_none_rounded,
        iconColor: AppColors.secondary,
        title: l10n.notificationSystemTitle,
        body: l10n.notificationSystemMessage,
        time: l10n.notificationYesterday,
        isRead: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final notifications = _notifications(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: _screenPadding,
            top: _topInset,
            end: _screenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _NotificationsHeader(),
              const SizedBox(height: _contentTopGap),
              Expanded(
                child: _showEmptyState
                    ? const _NotificationsEmptyState()
                    : _NotificationsContent(notifications: notifications),
              ),
              // TODO: Replace static notifications with notifications API.
              // TODO: Add read/unread handling through API later if needed.
            ],
          ),
        ),
      ),
    );
  }
}

class _LocalNotification {
  const _LocalNotification({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
    required this.time,
    required this.isRead,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String body;
  final String time;
  final bool isRead;
}

class _NotificationsHeader extends StatelessWidget {
  const _NotificationsHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: NotificationsScreen._headerHeight,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.pop(),
              child: SizedBox(
                width: NotificationsScreen._headerIconSize,
                height: NotificationsScreen._headerIconSize,
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: NotificationsScreen._headerIconSize,
                  color: AppColors.onSurface(context),
                ),
              ),
            ),
            const SizedBox(width: NotificationsScreen._headerGap),
            Text(
              l10n.notificationsTitle,
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

class _NotificationsContent extends StatelessWidget {
  const _NotificationsContent({required this.notifications});

  final List<_LocalNotification> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(bottom: 24),
      physics: const ClampingScrollPhysics(),
      itemCount: notifications.length,
      separatorBuilder: (_, _) {
        return const SizedBox(height: NotificationsScreen._cardGap);
      },
      itemBuilder: (context, index) {
        return _NotificationCard(notification: notifications[index]);
      },
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.notification});

  final _LocalNotification notification;

  @override
  Widget build(BuildContext context) {
    final unreadTint = AppColors.primary.withValues(alpha: 0.06);
    final cardColor = notification.isRead
        ? AppColors.surfaceCard(context)
        : Color.alphaBlend(unreadTint, AppColors.surfaceCard(context));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // TODO: Navigate to notification details when a target exists.
      },
      child: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(NotificationsScreen._cardRadius),
          border: Border.all(color: AppColors.border(context), width: 0.5),
          boxShadow: Theme.of(context).brightness == Brightness.dark
              ? null
              : [
                  BoxShadow(
                    color: AppColors.onSurface(context).withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NotificationIcon(notification: notification),
            const SizedBox(width: 10),
            Expanded(child: _NotificationText(notification: notification)),
            const SizedBox(width: 8),
            _NotificationMeta(notification: notification),
          ],
        ),
      ),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  const _NotificationIcon({required this.notification});

  final _LocalNotification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: NotificationsScreen._iconContainerSize,
      height: NotificationsScreen._iconContainerSize,
      decoration: BoxDecoration(
        color: notification.iconColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(NotificationsScreen._cardRadius),
      ),
      alignment: Alignment.center,
      child: Icon(
        notification.icon,
        size: NotificationsScreen._iconSize,
        color: notification.iconColor,
      ),
    );
  }
}

class _NotificationText extends StatelessWidget {
  const _NotificationText({required this.notification});

  final _LocalNotification notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notification.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: AppTextStyles.body(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 14,
            fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.w600,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          notification.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.paragraph(context),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}

class _NotificationMeta extends StatelessWidget {
  const _NotificationMeta({required this.notification});

  final _LocalNotification notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!notification.isRead)
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        if (!notification.isRead) const SizedBox(height: 8),
        Text(
          notification.time,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.hint(context),
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}

class _NotificationsEmptyState extends StatelessWidget {
  const _NotificationsEmptyState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Transform.translate(
        offset: const Offset(0, -12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.notificationEmptyIcon,
              width: 80,
              height: 80,
              colorFilter: ColorFilter.mode(
                AppColors.hint(context),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.notificationsEmptyTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.footerSecondary(context).copyWith(
                color: AppColors.paragraph(context),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 260),
              child: Text(
                l10n.notificationsEmptyMessage,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.caption(context).copyWith(
                  color: AppColors.hint(context),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
