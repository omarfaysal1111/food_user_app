import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  static const _body =
      'هذه صفحة الشروط والاحكام الخاصة بالتطبيق. باستخدامك لهذا التطبيق، فإنك توافق على الالتزام بسياسات الاستخدام، واحترام قواعد المنصة، والحفاظ على سرية بيانات حسابك. سيتم تحديث هذه الصفحة لاحقاً بالمحتوى القانوني النهائي.';

  @override
  Widget build(BuildContext context) {
    final bg = AppColors.scaffoldBackground(context);
    final fg = AppColors.onSurface(context);
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        foregroundColor: fg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: fg,
          onPressed: () => context.pop(),
        ),
        title: Text(
          'الشروط والاحكام',
          style: AppTextStyles.appBarTitle(context),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          child: Text(
            _body,
            textAlign: TextAlign.right,
            style: AppTextStyles.termsBody(context),
          ),
        ),
      ),
    );
  }
}
