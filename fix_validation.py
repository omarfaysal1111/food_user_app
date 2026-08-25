import re

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'r') as f:
    content = f.read()

# Add _errorText variable to state
pattern1 = re.compile(r'class _CardFormSheetState extends State<_CardFormSheet> \{\n  late final TextEditingController _numberController;')
replacement1 = r'''class _CardFormSheetState extends State<_CardFormSheet> {
  String? _errorText;
  late final TextEditingController _numberController;'''
content = re.sub(pattern1, replacement1, content)

# Replace validation logic
pattern2 = re.compile(r'const SizedBox\(height: 20\),\n                _SheetBottomBar\(\n                  label: widget\.isEdit \? l10n\.updateCard : l10n\.addCard,\n                  bottomPadding: bottomSafe \+ 20,\n                  onTap: \(\) \{.*?\n                  \},\n                \),', re.DOTALL)
replacement2 = r'''if (_errorText != null) ...[
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    child: Text(
                      _errorText!,
                      style: AppTextStyles.inputText(context).copyWith(
                        color: AppColors.fieldError(context),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                ] else
                  const SizedBox(height: 20),
                _SheetBottomBar(
                  label: widget.isEdit ? l10n.updateCard : l10n.addCard,
                  bottomPadding: bottomSafe + 20,
                  onTap: () {
                    final num = _numberController.text.trim();
                    final exp = _expiryController.text.trim();
                    final cvv = _cvvController.text.trim();

                    if (num.length != 16 || !_passesLuhn(num)) {
                      setState(() => _errorText = 'Invalid card number');
                      return;
                    }

                    if (!_isValidExpiry(exp)) {
                      setState(() => _errorText = 'Invalid expiry date');
                      return;
                    }

                    if (cvv.length < 3 || cvv.length > 4) {
                      setState(() => _errorText = 'Invalid CVV');
                      return;
                    }

                    setState(() => _errorText = null);
                    
                    if (!mounted) return;

                    Navigator.of(context).pop(
                      _CardFormResult(
                        cardNumber: num,
                        expiry: exp,
                        cvv: cvv,
                      ),
                    );
                  },
                ),'''
# replace backslashes correctly for python re.sub replacement string
replacement2 = replacement2.replace('\\', '\\\\')

content = re.sub(pattern2, replacement2, content)

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'w') as f:
    f.write(content)
