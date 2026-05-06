import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          children: [
            Expanded(child: Divider(color: Color(0xFFE5E5E5))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'او',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFA7A7A7), fontSize: 12),
              ),
            ),
            Expanded(child: Divider(color: Color(0xFFE5E5E5))),
          ],
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () {
            // TODO: Reconnect AuthBloc and real API after backend is ready.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('دخول عبر Apple قريباً')),
            );
          },
          icon: Image.network(
            'https://www.figma.com/api/mcp/asset/f855905d-9bbc-48f1-b66d-f1ef84f5d516',
            width: 23,
            height: 28,
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 44),
            side: const BorderSide(color: Color(0xFFE5E5E5)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          label: const Text('دخول عبر Apple', style: TextStyle(color: Color(0xFF1B1B1B))),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {
            // TODO: Reconnect AuthBloc and real API after backend is ready.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('دخول عبر Google قريباً')),
            );
          },
          icon: Image.network(
            'https://www.figma.com/api/mcp/asset/e25a2a0c-0088-4777-a734-4d2b145cddd1',
            width: 28,
            height: 28,
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 44),
            side: const BorderSide(color: Color(0xFFE5E5E5)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          label: const Text('دخول عبر Google', style: TextStyle(color: Color(0xFF1B1B1B))),
        ),
      ],
    );
  }
}
