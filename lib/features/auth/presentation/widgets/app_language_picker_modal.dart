import 'package:flutter/material.dart';
import 'package:food_user_app/core/localization/app_locale_scope.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

/// Fixed option labels (never translated).
class AppLanguagePickerLabels {
  AppLanguagePickerLabels._();

  static const arabicOption = 'عربي';
  static const englishOption = 'English';
}

Future<void> showAppLanguagePicker(BuildContext context) {
  final barrierLabel = MaterialLocalizations.of(
    context,
  ).modalBarrierDismissLabel;

  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: barrierLabel,
    barrierColor: AppColors.languageModalBarrier(context),
    pageBuilder: (dialogContext, animation, secondaryAnimation) {
      final l10n = AppLocalizations.of(dialogContext)!;
      final controller = AppLocaleScope.of(dialogContext);
      final current = controller.locale.languageCode;

      final isDark = Theme.of(dialogContext).brightness == Brightness.dark;

      return Center(
        child: FractionallySizedBox(
          widthFactor: 0.88,
          child: Material(
            color: AppColors.languageModalBackground(dialogContext),
            elevation: isDark ? 14 : 4,
            shadowColor: Theme.of(
              dialogContext,
            ).colorScheme.shadow.withValues(alpha: isDark ? 0.45 : 0.25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
              side: BorderSide(
                color: AppColors.languageModalBorder(dialogContext),
                width: 0.5,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.changeAppLanguageTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading4(dialogContext),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Divider(
                      height: 1,
                      thickness: 0.5,
                      color: AppColors.languageModalDivider(dialogContext),
                    ),
                  ),
                  _LanguagePickerOptionRow(
                    label: AppLanguagePickerLabels.arabicOption,
                    selected: current == 'ar',
                    onTap: () async {
                      await controller.setLocale(const Locale('ar'));
                      if (dialogContext.mounted) {
                        Navigator.of(dialogContext).pop();
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: AppColors.languageModalDivider(dialogContext),
                  ),
                  _LanguagePickerOptionRow(
                    label: AppLanguagePickerLabels.englishOption,
                    selected: current == 'en',
                    onTap: () async {
                      await controller.setLocale(const Locale('en'));
                      if (dialogContext.mounted) {
                        Navigator.of(dialogContext).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class _LanguagePickerOptionRow extends StatelessWidget {
  const _LanguagePickerOptionRow({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 76),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
            child: SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerRight,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(label, style: AppTextStyles.body(context)),
                      const SizedBox(width: 12),
                      _LanguageRadioDot(selected: selected),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageRadioDot extends StatelessWidget {
  const _LanguageRadioDot({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final ring = AppColors.onSurface(context);
    return SizedBox(
      width: 24,
      height: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ring, width: 1.5),
          color: AppColors.transparent,
        ),
        child: selected
            ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.onSurface(context),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
