// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Food User App';

  @override
  String get changeAppLanguageTitle => 'Change App Language';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get languageEnglish => 'English';

  @override
  String get generalSettingsTitle => 'General Settings';

  @override
  String get changeAppLanguage => 'Change App Language';

  @override
  String get notificationsControl => 'Notifications Control';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmptyTitle => 'No notifications yet';

  @override
  String get notificationsEmptyMessage =>
      'Updates about orders and offers will appear here.';

  @override
  String get notificationOrderTitle => 'Order update';

  @override
  String get notificationOrderMessage =>
      'Your order is being prepared and will be on its way soon.';

  @override
  String get notificationOfferTitle => 'New offer';

  @override
  String get notificationOfferMessage =>
      'Save on your next meal with today\'s special offer.';

  @override
  String get notificationSystemTitle => 'Account notification';

  @override
  String get notificationSystemMessage =>
      'Your account settings were updated successfully.';

  @override
  String get notificationToday => 'Today';

  @override
  String get notificationYesterday => 'Yesterday';

  @override
  String get notificationTimeNow => 'Now';

  @override
  String get notificationSampleTime => '2:30 PM';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get arabicLanguage => 'Arabic';

  @override
  String get englishLanguage => 'English';

  @override
  String get deleteAccountComingSoon => 'Delete account flow is coming soon.';

  @override
  String get deleteAccountConfirmationTitle => 'Delete Account';

  @override
  String get deleteAccountConfirmationMessage =>
      'Delete account flow will be connected later.';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get loginTitle => 'Sign in!';

  @override
  String get loginSubtitle => 'Welcome back — sign in to continue.';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginEmailHint => 'Email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginPasswordHint => 'Password';

  @override
  String get loginForgotPassword => 'Forgot password?';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String get loginSubmitting => '…';

  @override
  String get loginNoAccount => 'Don\'t have an account? ';

  @override
  String get loginCreateAccount => 'Create account';

  @override
  String get registerWelcomeTitle => 'Welcome!';

  @override
  String get registerWelcomeSubtitle =>
      'Join us today and enjoy faster delivery.';

  @override
  String get registerUsernameLabel => 'Username';

  @override
  String get registerUsernameHint => 'Username';

  @override
  String get registerPhoneLabel => 'Mobile number';

  @override
  String get registerPhoneHint => 'Mobile number';

  @override
  String get registerEmailLabel => 'Email';

  @override
  String get registerEmailHint => 'Email';

  @override
  String get registerPasswordLabel => 'Password';

  @override
  String get registerPasswordHint => 'Password';

  @override
  String get registerConfirmPasswordLabel => 'Confirm password';

  @override
  String get registerConfirmPasswordHint => 'Confirm password';

  @override
  String get registerTermsPrefix => 'I agree to the ';

  @override
  String get registerTermsLink => 'Terms & Conditions';

  @override
  String get registerTermsError => 'You must accept the Terms & Conditions.';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerHasAccount => 'Already have an account? ';

  @override
  String get registerSignIn => 'Sign in';

  @override
  String get forgotPasswordTitle => 'Forgot password!';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email so we can verify your account.';

  @override
  String get forgotPasswordSubmit => 'Confirm';

  @override
  String get resetPasswordTitle => 'Reset password!';

  @override
  String get resetPasswordSubtitle =>
      'Enter a new password to keep your data secure.';

  @override
  String get resetPasswordSubmit => 'Confirm';

  @override
  String get otpTitle => 'Verification code';

  @override
  String get otpSubtitle =>
      'Enter the code sent to you to confirm your mobile number and continue.';

  @override
  String get otpVerify => 'Verify';

  @override
  String otpTimerSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String get otpResend => 'Resend code?';

  @override
  String get otpResentSnackbar => 'Code sent again';

  @override
  String get termsTitle => 'Terms & Conditions';

  @override
  String get termsBody =>
      'This is the Terms & Conditions page for the app. By using this app, you agree to follow the usage policies, respect platform rules, and keep your account information confidential. This page will be updated with final legal content later.';

  @override
  String get onboardingTitleLine1 => 'Order more, wait less …';

  @override
  String get onboardingTitleAccent => ' Order now';

  @override
  String get onboardingDescription =>
      'Faster delivery, more options, and an experience designed\nfor your comfort with every order.';

  @override
  String get onboardingCta => 'Start now';

  @override
  String get mainTabHome => 'Home';

  @override
  String get mainTabCart => 'Cart';

  @override
  String get mainTabOrders => 'Orders';

  @override
  String get mainTabAccount => 'Account';

  @override
  String get cartTitle => 'Cart';

  @override
  String get cartRestaurantSubtitle => 'Your order from Az Al Sham Restaurant';

  @override
  String get cartProductBurgerCombo => 'Burger meal with fries offer';

  @override
  String get cartNotesHint => 'Your notes here...';

  @override
  String get cartDiscountCode => 'Discount code';

  @override
  String get cartCheckout => 'Continue payment';

  @override
  String get cartAddMore => 'Add more';

  @override
  String cartPrice(int amount) {
    return '$amount EGP';
  }

  @override
  String get productDetailsTitle => 'Product details';

  @override
  String get productBurgerDescription =>
      'Fresh burger sandwich made with grilled beef, special burger sauce, served with crispy fries.';

  @override
  String get productAddNotes => 'Add your notes';

  @override
  String get productTypeTitle => 'Type';

  @override
  String get productTypeChicken => 'Chicken';

  @override
  String get productTypeMeat => 'Meat';

  @override
  String get productFlavorTitle => 'Flavor';

  @override
  String get productFlavorNormal => 'Normal';

  @override
  String get productFlavorHot => 'Hot';

  @override
  String get productAddSomethingTitle => 'Add something else?';

  @override
  String get productAddSomethingSubtitle => 'Choose the extras that suit you';

  @override
  String get productAddonWater => 'Mineral water';

  @override
  String get productAddonToast => 'Berry toast';

  @override
  String get productAddonChips => 'Chips';

  @override
  String get productAddToCart => 'Add to cart';

  @override
  String get ordersTitle => 'Orders';

  @override
  String get orderRestaurantAzAlSham => 'Az Al Sham';

  @override
  String get orderProductsCount => '3 products';

  @override
  String get orderEstimatedArrival => 'Expected arrival time';

  @override
  String get orderEstimatedArrivalRange => '15 : 20 min';

  @override
  String get orderWaitingAcceptance => 'Your order is waiting for acceptance';

  @override
  String get orderWaitingAcceptanceShort => 'Waiting for acceptance';

  @override
  String get orderPreparing => 'Your order is being prepared';

  @override
  String get orderPreparingShort => 'Being prepared';

  @override
  String get orderCourierOnWay => 'The courier is on the way to you';

  @override
  String get orderCourierOnWayShort => 'Courier on the way';

  @override
  String get orderDelivered => 'Order delivered';

  @override
  String get orderDeliveredShort => 'Closed order';

  @override
  String get orderCancelled => 'Order cancelled';

  @override
  String get orderCancelledShort => 'Cancelled order';

  @override
  String orderNumber(String number) {
    return 'Order #$number';
  }

  @override
  String get orderTotal => '340 EGP';

  @override
  String get orderDetails => 'View order';

  @override
  String get reorder => 'New order';

  @override
  String get trackOrder => 'Track order';

  @override
  String get trackYourOrder => 'Track your order';

  @override
  String get deliverTo => 'Deliver to:';

  @override
  String get orderItemsTitle => 'Ordered items:';

  @override
  String get paymentSummary => 'Order summary:';

  @override
  String get orderSubtotal => 'Order value';

  @override
  String get orderSubtotalValue => '400 EGP';

  @override
  String get orderDeliveryFee => 'Delivery';

  @override
  String get orderDeliveryFeeValue => '20 EGP';

  @override
  String get orderDiscount => 'Discount';

  @override
  String get orderDiscountValue => '80 EGP';

  @override
  String get orderGrandTotal => 'Total:';

  @override
  String orderQuantity(int count) {
    return 'Qty: $count';
  }

  @override
  String get orderProductName => 'Burger meal with fries offer';

  @override
  String get orderProductPrice => '200 EGP';

  @override
  String get cancelOrder => 'Cancel order';

  @override
  String get orderCancelDesignOnly => 'Order cancelled for design preview';

  @override
  String get courierDetails => 'Courier details:';

  @override
  String get orderCourierName => 'Ahmed Ali';

  @override
  String get orderCourierPhone => '01004059966';

  @override
  String get orderCourierRating => '4.5';

  @override
  String get orderAcceptedShort => 'Accepted';

  @override
  String get orderHandedToCourierShort => 'Handed to courier';

  @override
  String get orderYouCancelled => 'You cancelled the order';

  @override
  String get cancellationReasonTitle => 'Cancellation reason:';

  @override
  String get cancellationReasonSample => 'Delayed order confirmation';

  @override
  String get rateOrderTitle => 'Rating';

  @override
  String get yourRating => 'Your rating';

  @override
  String get ratingFeedbackHint =>
      'Write how satisfied you are with the service';

  @override
  String get skipRating => 'Skip';

  @override
  String get submitRating => 'Send';

  @override
  String get ratingSubmittedDesignOnly => 'Rating submitted for design preview';

  @override
  String get orderDetailsDesignOnly => 'Updated for design preview';

  @override
  String get rateOrder => 'Rate order';

  @override
  String get currentOrders => 'Current';

  @override
  String get previousOrders => 'Previous';

  @override
  String get cancelledOrders => 'Cancelled';

  @override
  String get accountTitle => 'My Account';

  @override
  String get accountPlaceholderName => 'Ahmed Farag';

  @override
  String get accountPlaceholderEmail => 'afarag74@gmail.com';

  @override
  String get accountGeneralSettings => 'General Settings';

  @override
  String get accountFavorites => 'Favorites';

  @override
  String get accountDiscountPoints => 'Discount Points';

  @override
  String get accountSavedAddresses => 'Saved Addresses';

  @override
  String get accountCards => 'Cards';

  @override
  String get accountTechnicalSupport => 'Technical Support';

  @override
  String get accountTermsAndConditions => 'Terms & Conditions';

  @override
  String get accountLogout => 'Logout';

  @override
  String get accountLoggingOut => 'Logging out...';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmptyTitle => 'No favorites yet';

  @override
  String get favoritesEmptyMessage =>
      'Restaurants and meals you save will appear here.';

  @override
  String get favoriteSampleRestaurant => 'El Kelany Restaurant';

  @override
  String get favoriteSampleDescription =>
      'Grilled meals, sandwiches, and fast delivery';

  @override
  String get favoriteSampleMeal => 'Grilled Chicken Meal';

  @override
  String get favoriteSampleMealDescription => 'Chicken, rice, salad, and sauce';

  @override
  String get favoriteDeliveryTime => '20 - 30 min';

  @override
  String get favoriteRating => '4.8';

  @override
  String get favoriteRestaurantAzAlSham => 'Az Al Sham Restaurant';

  @override
  String get favoriteStatusAvailable => 'Available';

  @override
  String get favoriteStatusBusy => 'Busy';

  @override
  String get favoriteStatusClosed => 'Closed';

  @override
  String get favoriteDeliveryTimeRange => '30-45 min';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get savedAddressesTitle => 'Saved Addresses';

  @override
  String get homeAddressTitle => 'Home';

  @override
  String get workAddressTitle => 'Work';

  @override
  String get sampleHomeAddress => '15 Tahrir Street, Dokki, Giza';

  @override
  String get sampleWorkAddress => '12 Nile Corniche, Maadi, Cairo';

  @override
  String get addNewAddress => 'Add New Address';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get deleteAddress => 'Delete Address';

  @override
  String get deleteAddressTitle => 'Delete Address';

  @override
  String get deleteAddressMessage =>
      'Are you sure you want to delete this address?';

  @override
  String get confirmLocation => 'Confirm';

  @override
  String get addAddressTitle => 'New Address';

  @override
  String get editAddressTitle => 'Edit Address';

  @override
  String get saveAddress => 'Confirm Add';

  @override
  String get updateAddress => 'Confirm Edit';

  @override
  String get building => 'Building Number';

  @override
  String get apartment => 'Apartment Number';

  @override
  String get floor => 'Floor';

  @override
  String get addressSavedDesignOnly => 'Address saved for design preview';

  @override
  String get addressUpdatedDesignOnly => 'Address updated for design preview';

  @override
  String get chooseLocation => 'Select Location';

  @override
  String get selectedLocation => 'Your current address';

  @override
  String get searchForAddress => 'Search for your location';

  @override
  String get currentLocation => 'Current location';

  @override
  String get deliveryAddress => 'New Cairo, Madinaty, Al Zuhour District';

  @override
  String get sampleAddressMeta =>
      'Building: El Saadany / Apartment: 201 / Floor: Fifth';

  @override
  String get apartmentAddressTitle => 'Apartment';

  @override
  String get sampleBuildingName => 'El Saadany';

  @override
  String get sampleApartmentNumber => '201';

  @override
  String get sampleFloorName => 'Fifth';

  @override
  String get editAddress => 'Edit Address';

  @override
  String get helpSupportTitle => 'Help & Support';

  @override
  String get faqTitle => 'FAQ';

  @override
  String get supportOrderIssue => 'I have an issue with an order';

  @override
  String get supportPaymentIssue => 'Payment and refund help';

  @override
  String get supportContactUs => 'Contact us';

  @override
  String get supportPhone => 'Call support';

  @override
  String get supportWhatsapp => 'WhatsApp support';

  @override
  String get supportEmail => 'Email support';

  @override
  String get supportChatTitle => 'Technical Support';

  @override
  String get supportToday => 'Today';

  @override
  String get supportGoodEvening => 'Good evening';

  @override
  String get supportHowCanWeHelp => 'How can we help you?';

  @override
  String get supportSampleUserIssue =>
      'I have a problem with Az Al Sham Restaurant. The food was delayed beyond the expected time.';

  @override
  String get supportInputHint => 'Write here...';

  @override
  String get supportAttachmentOptions => 'Attachment options';

  @override
  String get supportPickImage => 'Pick Image';

  @override
  String get supportPickVideo => 'Pick Video';

  @override
  String get supportCancelAttachment => 'Cancel';

  @override
  String get supportImageMessage => 'Image';

  @override
  String get supportVideoMessage => 'Video';

  @override
  String get cardsTitle => 'Cards';

  @override
  String get paymentMethodsTitle => 'Payment Methods';

  @override
  String get noCardsMessage => 'You don\'t have any card';

  @override
  String get addNewCard => 'Add New Card';

  @override
  String get addCard => 'Add';

  @override
  String get editCard => 'Edit';

  @override
  String get editCardTitle => 'Edit Card Details';

  @override
  String get deleteCard => 'Delete';

  @override
  String get deleteCardTitle => 'Delete Card';

  @override
  String get deleteCardMessage => 'Are you sure you want to delete this card?';

  @override
  String get confirmDelete => 'Delete Card';

  @override
  String get updateCard => 'Edit';

  @override
  String get cardHolderName => 'Card Holder Name';

  @override
  String get cardNumber => 'Card Number';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get cvv => 'CVV';

  @override
  String get sampleCardHolder => 'Ahmed Farag';

  @override
  String get sampleMaskedCardNumber => '**** **** **** 1234';

  @override
  String get sampleCardExpiry => '2026';

  @override
  String get paymentCardEnding => 'Visa ending in 4242';

  @override
  String get paymentIntegrationComingSoon =>
      'Payment card saving is coming soon.';

  @override
  String get cardAddedDesignOnly => 'Card added for design preview';

  @override
  String get cardUpdatedDesignOnly => 'Card updated for design preview';

  @override
  String get cardDeletedDesignOnly => 'Card deleted for design preview';

  @override
  String get editProfileTitle => 'Edit Personal Data';

  @override
  String get personalDataTitle => 'Personal Data';

  @override
  String get fullName => 'Full Name';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get email => 'Email';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get profileChangesSaved => 'Changes saved for design preview';

  @override
  String get changePhone => 'Change';

  @override
  String get changePhoneTitle => 'Change Phone Number';

  @override
  String get changePhoneSubtitle =>
      'Enter your new number correctly so we can send the activation code.';

  @override
  String get newPhoneNumber => 'New Phone Number';

  @override
  String get continueButton => 'Continue';

  @override
  String get verifyPhoneTitle => 'Verification Code';

  @override
  String get verifyPhoneMessage =>
      'A code was sent to your new number for verification.';

  @override
  String get otpCode => 'OTP Code';

  @override
  String get confirmOtp => 'Confirm';

  @override
  String get resendCode => 'Resend code?';

  @override
  String resendCodeTimer(int seconds) {
    return '${seconds}s';
  }

  @override
  String get phoneChangedTitle => 'Phone number changed successfully';

  @override
  String get phoneChangedMessage =>
      'Your phone number has been updated for design preview.';

  @override
  String get profileUpdatedDesignOnly => 'Profile updated for design preview';

  @override
  String get invalidPhoneMessage => 'Please enter a phone number';

  @override
  String get invalidPhoneLengthMessage =>
      'Phone number must be 11 or 12 digits';

  @override
  String get invalidOtpMessage => 'Please enter the complete verification code';

  @override
  String get socialDivider => 'or';

  @override
  String get socialAppleSoon => 'Sign in with Apple is coming soon';

  @override
  String get socialGoogleSoon => 'Sign in with Google is coming soon';

  @override
  String get socialAppleLabel => 'Sign in with Apple';

  @override
  String get socialGoogleLabel => 'Sign in with Google';

  @override
  String get validationEmailRequiredDotComRequired => 'Email is required';

  @override
  String get validationEmailRequiredDotComInvalid =>
      'Please enter a valid email address';

  @override
  String get validationEmailRequiredDotComNeedsCom =>
      'Email must end with .com';

  @override
  String get validationPasswordRequired => 'Password is required';

  @override
  String get validationPasswordMin8 => 'Password must be at least 8 characters';

  @override
  String get validationUsernameRequired => 'Username is required';

  @override
  String get validationUsernameMin3 => 'Username must be at least 3 characters';

  @override
  String get validationPhoneRequired => 'Mobile number is required';

  @override
  String get validationPhoneEgyptian =>
      'Please enter a valid Egyptian mobile number (10 or 11 digits after +20)';

  @override
  String get validationConfirmPasswordRequired =>
      'Password confirmation is required';

  @override
  String get validationConfirmPasswordMismatch => 'Passwords do not match';

  @override
  String get validationOtpRequired => 'Verification code is required';

  @override
  String get validationOtpSixDigits => 'Please enter 6 digits';
}
