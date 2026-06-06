import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return _CardsScaffold(
      title: l10n.cardsTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.paymentMethodsTitle,
            style: AppTextStyles.heading4(context),
          ),
          const SizedBox(height: 12),
          _PaymentCard(
            holder: l10n.sampleCardHolder,
            ending: l10n.paymentCardEnding,
          ),
          const SizedBox(height: AppSpacing.lg),
          _AddCardButton(label: l10n.addCard),
          const SizedBox(height: 12),
          Text(
            l10n.paymentIntegrationComingSoon,
            style: AppTextStyles.caption(context).copyWith(height: 1.35),
          ),
          // TODO: Integrate real payment card saving once payment backend exists.
        ],
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard({required this.holder, required this.ending});

  final String holder;
  final String ending;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.all(AppRadius.md),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.24),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.credit_card_rounded,
            color: AppColors.text,
            size: 28,
          ),
          const Spacer(),
          Text(
            ending,
            style: AppTextStyles.body(
              context,
            ).copyWith(color: AppColors.text, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            holder,
            style: AppTextStyles.caption(
              context,
            ).copyWith(color: AppColors.text.withValues(alpha: 0.78)),
          ),
        ],
      ),
    );
  }
}

class _AddCardButton extends StatelessWidget {
  const _AddCardButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard(context),
          borderRadius: const BorderRadius.all(AppRadius.sm),
          border: Border.all(color: AppColors.border(context), width: 0.5),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_rounded, color: AppColors.primary, size: 22),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.body(
                context,
              ).copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardsScaffold extends StatelessWidget {
  const _CardsScaffold({required this.title, required this.child});

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
            _CardsHeader(title: title),
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

class _CardsHeader extends StatelessWidget {
  const _CardsHeader({required this.title});

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
