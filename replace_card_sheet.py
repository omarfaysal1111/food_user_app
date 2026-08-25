import re

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'r') as f:
    content = f.read()

pattern = re.compile(r'class _CardFormSheetState extends State<_CardFormSheet> \{.*?\n\}\n\nclass _SheetHeader', re.DOTALL)

new_class = r"""class _CardFormSheetState extends State<_CardFormSheet> {
  late final TextEditingController _numberController;
  late final TextEditingController _expiryController;
  late final TextEditingController _cvvController;

  @override
  void initState() {
    super.initState();

    final card = widget.card;
    final displayCardNumber = widget.isEdit ? (card?.fullNumber ?? card?.maskedNumber ?? '') : '';
    
    _numberController = TextEditingController(text: displayCardNumber);
    _expiryController = TextEditingController(text: card?.expiry ?? '');
    _cvvController = TextEditingController();
  }

  @override
  void dispose() {
    _numberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  bool _passesLuhn(String cardNumber) {
    if (cardNumber.isEmpty) return false;
    int sum = 0;
    bool alternate = false;
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int n = int.parse(cardNumber[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) n -= 9;
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  bool _isValidExpiry(String expiry) {
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(expiry)) return false;
    final parts = expiry.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);
    if (month == null || year == null) return false;
    if (month < 1 || month > 12) return false;

    final now = DateTime.now();
    final currentYear = now.year % 100;
    final currentMonth = now.month;

    if (year < currentYear) return false;
    if (year == currentYear && month < currentMonth) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: keyboardInset),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Material(
          color: AppColors.scaffoldBackground(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16,
                    top: 16,
                    end: 16,
                  ),
                  child: _SheetHeader(
                    title: widget.isEdit ? l10n.editCardTitle : l10n.addNewCard,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      _SheetTextField(
                        label: l10n.cardNumber,
                        hint: l10n.cardNumber,
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: _SheetTextField(
                              label: l10n.expiryDate,
                              hint: l10n.expiryDate,
                              controller: _expiryController,
                              keyboardType: TextInputType.datetime,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                _ExpiryDateFormatter(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _SheetTextField(
                              label: l10n.cvv,
                              hint: 'CVV',
                              controller: _cvvController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _SheetBottomBar(
                  label: widget.isEdit ? l10n.updateCard : l10n.addCard,
                  bottomPadding: bottomSafe + 20,
                  onTap: () {
                    final num = _numberController.text.trim();
                    final exp = _expiryController.text.trim();
                    final cvv = _cvvController.text.trim();

                    if (num.length != 16 || !_passesLuhn(num)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid card number'), behavior: SnackBarBehavior.floating),
                      );
                      return;
                    }

                    if (!_isValidExpiry(exp)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid expiry date'), behavior: SnackBarBehavior.floating),
                      );
                      return;
                    }

                    if (cvv.length < 3 || cvv.length > 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid CVV'), behavior: SnackBarBehavior.floating),
                      );
                      return;
                    }

                    Navigator.of(context).pop(
                      _CardFormResult(
                        cardNumber: num,
                        expiry: exp,
                        cvv: cvv,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SheetHeader"""

# replace backslashes correctly for python re.sub replacement string
new_class = new_class.replace('\\', '\\\\')

new_content = re.sub(pattern, new_class, content)

with open('lib/features/checkout/presentation/pages/payment_method_screen.dart', 'w') as f:
    f.write(new_content)
