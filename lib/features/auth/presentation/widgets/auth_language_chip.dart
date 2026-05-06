import 'package:flutter/material.dart';

class AuthLanguageChip extends StatelessWidget {
  final String label;
  final String? flagImageUrl;
  final VoidCallback? onTap;

  const AuthLanguageChip({
    super.key,
    this.label = 'عربي',
    this.flagImageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE5E5E5), width: 0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF1B1B1B),
              ),
            ),
            const SizedBox(width: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 16,
                height: 16,
                child: flagImageUrl == null
                    ? const ColoredBox(color: Color(0xFFCE1126))
                    : Image.network(flagImageUrl!, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

