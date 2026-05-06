import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _acceptedTerms = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              AuthLanguageChip(
                flagImageUrl:
                    'https://www.figma.com/api/mcp/asset/f3313224-f65a-4c6c-9c87-33c61a83f82a',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Language switch is coming soon')),
                  );
                },
              ),
              const Spacer(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'مرحباً بك !',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1B1B1B),
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'انضم إلينا اليوم واستمتع بتجربة توصيل أسرع',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFA7A7A7),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          AuthTextField(
            controller: _usernameController,
            label: 'اسم المستخدم',
            hintText: 'اسم المستخدم',
          ),
          const SizedBox(height: 20),
          _PhoneField(controller: _phoneController),
          const SizedBox(height: 20),
          AuthTextField(
            controller: _emailController,
            label: 'البريد الالكتروني',
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          AuthTextField(
            controller: _passwordController,
            label: 'كلمة المرور',
            hintText: 'كلمة المرور',
            obscureText: true,
            suffixIcon: Image.network(
              'https://www.figma.com/api/mcp/asset/af47f040-9bbf-4d74-bb78-bf53e4ca4621',
              width: 16,
              height: 16,
            ),
          ),
          const SizedBox(height: 20),
          AuthTextField(
            controller: _confirmPasswordController,
            label: 'تأكيد كلمه المرور',
            hintText: 'تأكيد كلمه المرور',
            obscureText: true,
            suffixIcon: Image.network(
              'https://www.figma.com/api/mcp/asset/af47f040-9bbf-4d74-bb78-bf53e4ca4621',
              width: 16,
              height: 16,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 12, height: 1.3),
                  children: [
                    TextSpan(
                      text: 'الموافقه على ',
                      style: TextStyle(color: Color(0xFFA7A7A7)),
                    ),
                    TextSpan(
                      text: 'الشروط والاحكام',
                      style: TextStyle(
                        color: Color(0xFFA3090F),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 13),
              GestureDetector(
                onTap: () => setState(() => _acceptedTerms = !_acceptedTerms),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _acceptedTerms ? const Color(0xFFA3090F) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _acceptedTerms ? const Color(0xFFA3090F) : const Color(0xFFE5E5E5),
                      width: 0.5,
                    ),
                  ),
                  child: _acceptedTerms
                      ? Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.network(
                            'https://www.figma.com/api/mcp/asset/d59dd236-993c-47a2-b029-70f3f41c9de8',
                            fit: BoxFit.contain,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          AuthPrimaryButton(
            label: 'إنشاء حساب',
            onPressed: _acceptedTerms ? () => context.go(RouteNames.home) : null,
          ),
          const SizedBox(height: 24),
          Center(
            child: TextButton(
              onPressed: () => context.go(RouteNames.login),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'هل لديك حساب من قبل ؟ ',
                      style: TextStyle(color: Color(0xFFA7A7A7), height: 1.35),
                    ),
                    TextSpan(
                      text: 'تسجيل دخول',
                      style: TextStyle(
                        color: Color(0xFFA3090F),
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  final TextEditingController controller;

  const _PhoneField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'رقم الجوال',
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 14, color: Color(0xFF1B1B1B), height: 1.35),
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE5E5E5), width: 0.5),
          ),
          child: Row(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://www.figma.com/api/mcp/asset/1eb9f866-38e9-475c-a6a5-df5f41d9249d',
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '+20',
                    style: TextStyle(fontSize: 12, color: Color(0xFFA7A7A7), height: 1.3),
                  ),
                  const SizedBox(width: 8),
                  Container(width: 0.5, height: 16, color: const Color(0xFFE5E5E5)),
                  const SizedBox(width: 8),
                ],
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'رقم الجوال',
                    hintStyle: TextStyle(fontSize: 12, color: Color(0xFFB9B9B9), height: 1.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

