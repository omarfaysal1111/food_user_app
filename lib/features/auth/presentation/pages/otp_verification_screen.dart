import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget otpBox({bool active = false, String text = '-'}) {
      return Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active ? const Color(0xFF141414) : const Color(0xFFE5E5E5),
            width: 0.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: active ? const Color(0xFF1B1B1B) : const Color(0xFFA7A7A7),
            height: 1.3,
          ),
        ),
      );
    }

    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthBackButton(),
          const SizedBox(height: 20),
          const Text(
            'كود التحقق',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B1B1B),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'أدخل الكود المرسل إليك لتأكيد رقم الجوال والمتابعة.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 12, color: Color(0xFFA7A7A7), height: 1.3),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              otpBox(text: '-', active: false),
              otpBox(text: '-', active: false),
              otpBox(text: '-', active: false),
              otpBox(text: '-', active: false),
              otpBox(text: '-', active: false),
              otpBox(text: '7', active: true),
            ],
          ),
          const SizedBox(height: 20),
          AuthPrimaryButton(
            label: 'تحقق',
            onPressed: () => context.push(RouteNames.resetPassword),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '59 ثانية',
                style: TextStyle(fontSize: 14, color: Color(0xFFA7A7A7), height: 1.35),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('إعادة الإرسال قريباً')),
                  );
                },
                child: const Text(
                  'إعادة إرسال الكود ؟',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFA3090F),
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
