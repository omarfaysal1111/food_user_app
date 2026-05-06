import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AuthScaffold({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 24, 16, 24),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}

