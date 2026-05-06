import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 28,
        height: 28,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Color(0xFF1B1B1B),
          ),
        ),
      ),
    );
  }
}

