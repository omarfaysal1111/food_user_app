import re

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'r') as f:
    content = f.read()

# Replace _showCardActionsMenu
pattern1 = re.compile(r'_CardActionsMenu\(\s*onEdit: \(\) \{.*?\},\s*onDelete: \(\) \{', re.DOTALL)
replacement1 = r'_CardActionsMenu(\n                onDelete: () {'
content = re.sub(pattern1, replacement1, content)

# Replace _CardActionsMenu class definition
pattern2 = re.compile(r'class _CardActionsMenu extends StatelessWidget \{\n  const _CardActionsMenu\(\{required this\.onEdit, required this\.onDelete\}\);\n\n  final VoidCallback onEdit;\n  final VoidCallback onDelete;')
replacement2 = r'''class _CardActionsMenu extends StatelessWidget {
  const _CardActionsMenu({required this.onDelete});

  final VoidCallback onDelete;'''
content = re.sub(pattern2, replacement2, content)

# Remove Edit action and Divider from the menu
pattern3 = re.compile(r'_CardMenuAction\(\s*label: l10n\.editCard,\s*iconAsset: AppAssets\.paymentEditIcon,\s*onTap: onEdit,\s*\),\s*Divider\(\s*height: 12,\s*thickness: 0\.5,\s*color: AppColors\.border\(context\),\s*\),', re.DOTALL)
replacement3 = r''
content = re.sub(pattern3, replacement3, content)

# Update menu height const
pattern4 = re.compile(r'static const double _actionsMenuHeight = 84;')
replacement4 = r'static const double _actionsMenuHeight = 44;'
content = re.sub(pattern4, replacement4, content)

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'w') as f:
    f.write(content)
