import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return _SupportScaffold(
      title: l10n.helpSupportTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.faqTitle, style: AppTextStyles.heading4(context)),
          const SizedBox(height: 12),
          _SupportRow(
            icon: Icons.receipt_long_outlined,
            title: l10n.supportOrderIssue,
          ),
          _SupportDivider(),
          _SupportRow(
            icon: Icons.payments_outlined,
            title: l10n.supportPaymentIssue,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.supportContactUs, style: AppTextStyles.heading4(context)),
          const SizedBox(height: 12),
          _SupportRow(icon: Icons.call_outlined, title: l10n.supportPhone),
          _SupportDivider(),
          _SupportRow(
            icon: Icons.chat_bubble_outline_rounded,
            title: l10n.supportWhatsapp,
          ),
          _SupportDivider(),
          _SupportRow(icon: Icons.email_outlined, title: l10n.supportEmail),
          // TODO: Connect support rows to real contact/FAQ flows.
        ],
      ),
    );
  }
}

class _SupportRow extends StatelessWidget {
  const _SupportRow({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0x1AA3090F),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body(
                  context,
                ).copyWith(color: AppColors.onSurface(context)),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.chevron_right_rounded,
              size: 24,
              color: AppColors.paragraph(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, thickness: 0.5, color: AppColors.border(context));
  }
}

class _SupportScaffold extends StatelessWidget {
  const _SupportScaffold({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _SupportHeader(title: title),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 28, 16, 24),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportHeader extends StatelessWidget {
  const _SupportHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Row(
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
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: AppTextStyles.appBarTitle(context).copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
