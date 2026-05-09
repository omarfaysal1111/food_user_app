import 'package:flutter/material.dart';

extension LocaleContextX on BuildContext {
  bool get isArabic =>
      Localizations.localeOf(this).languageCode.toLowerCase() == 'ar';

  TextDirection get textDirection => Directionality.of(this);

  AlignmentDirectional get centerStart =>
      AlignmentDirectional.centerStart;

  TextAlign get textAlignStart => TextAlign.start;
}
