import re

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'r') as f:
    content = f.read()

# 1. Add _CardNumberFormatter
formatter_code = r'''class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
'''
new_formatter_code = r'''class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;
    
    if (oldValue.text.length > newValue.text.length) {
      if (oldValue.text.endsWith(' ') && !newValue.text.endsWith(' ')) {
        text = text.substring(0, text.length - 1);
      }
    }
    
    final newText = text.replaceAll(' ', '');
    if (newText.length > 19) return oldValue;

    final buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(newText[i]);
    }

    final formattedString = buffer.toString();

    int cursorPosition = newValue.selection.end;
    if (cursorPosition > text.length) {
      cursorPosition = text.length;
    }
    
    String rawBeforeCursor = text.substring(0, cursorPosition).replaceAll(' ', '');
    
    int newCursorPosition = rawBeforeCursor.length;
    for (int i = 0; i < rawBeforeCursor.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newCursorPosition++;
      }
    }

    return TextEditingValue(
      text: formattedString,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }
}

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
'''

content = content.replace(formatter_code, new_formatter_code)

# 2. Update the inputFormatters array in the Card Number text field
old_field = r'''_SheetTextField(
                        label: l10n.cardNumber,
                        hint: l10n.cardNumber,
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                      ),'''

new_field = r'''_SheetTextField(
                        label: l10n.cardNumber,
                        hint: l10n.cardNumber,
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                          _CardNumberFormatter(),
                        ],
                      ),'''

content = content.replace(old_field, new_field)

# 3. Update the validation in onTap
old_val = r'''                    final num = _numberController.text.trim();
                    final exp = _expiryController.text.trim();
                    final cvv = _cvvController.text.trim();

                    if (num.length != 16 || !_passesLuhn(num)) {'''

new_val = r'''                    final num = _numberController.text.trim();
                    final exp = _expiryController.text.trim();
                    final cvv = _cvvController.text.trim();

                    final rawNum = num.replaceAll(' ', '');

                    if (rawNum.length < 15 || rawNum.length > 19 || !_passesLuhn(rawNum)) {'''

content = content.replace(old_val, new_val)

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'w') as f:
    f.write(content)
