import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Food User App'**
  String get appTitle;

  /// No description provided for @changeAppLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Change App Language'**
  String get changeAppLanguageTitle;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageArabic;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @generalSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettingsTitle;

  /// No description provided for @changeAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change App Language'**
  String get changeAppLanguage;

  /// No description provided for @notificationsControl.
  ///
  /// In en, this message translates to:
  /// **'Notifications Control'**
  String get notificationsControl;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @arabicLanguage.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabicLanguage;

  /// No description provided for @englishLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// No description provided for @deleteAccountComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Delete account flow is coming soon.'**
  String get deleteAccountComingSoon;

  /// No description provided for @deleteAccountConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountConfirmationTitle;

  /// No description provided for @deleteAccountConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete account flow will be connected later.'**
  String get deleteAccountConfirmationMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in!'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back — sign in to continue.'**
  String get loginSubtitle;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailLabel;

  /// No description provided for @loginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailHint;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordHint;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get loginForgotPassword;

  /// No description provided for @loginSubmit.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginSubmit;

  /// No description provided for @loginSubmitting.
  ///
  /// In en, this message translates to:
  /// **'…'**
  String get loginSubmitting;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get loginNoAccount;

  /// No description provided for @loginCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get loginCreateAccount;

  /// No description provided for @registerWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get registerWelcomeTitle;

  /// No description provided for @registerWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join us today and enjoy faster delivery.'**
  String get registerWelcomeSubtitle;

  /// No description provided for @registerUsernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get registerUsernameLabel;

  /// No description provided for @registerUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get registerUsernameHint;

  /// No description provided for @registerPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get registerPhoneLabel;

  /// No description provided for @registerPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get registerPhoneHint;

  /// No description provided for @registerEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registerEmailLabel;

  /// No description provided for @registerEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registerEmailHint;

  /// No description provided for @registerPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerPasswordLabel;

  /// No description provided for @registerPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerPasswordHint;

  /// No description provided for @registerConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get registerConfirmPasswordLabel;

  /// No description provided for @registerConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get registerConfirmPasswordHint;

  /// No description provided for @registerTermsPrefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get registerTermsPrefix;

  /// No description provided for @registerTermsLink.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get registerTermsLink;

  /// No description provided for @registerTermsError.
  ///
  /// In en, this message translates to:
  /// **'You must accept the Terms & Conditions.'**
  String get registerTermsError;

  /// No description provided for @registerSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get registerSubmit;

  /// No description provided for @registerHasAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get registerHasAccount;

  /// No description provided for @registerSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get registerSignIn;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot password!'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email so we can verify your account.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @forgotPasswordSubmit.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get forgotPasswordSubmit;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password!'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter a new password to keep your data secure.'**
  String get resetPasswordSubtitle;

  /// No description provided for @resetPasswordSubmit.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get resetPasswordSubmit;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to you to confirm your mobile number and continue.'**
  String get otpSubtitle;

  /// No description provided for @otpVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get otpVerify;

  /// No description provided for @otpTimerSeconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String otpTimerSeconds(int seconds);

  /// No description provided for @otpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend code?'**
  String get otpResend;

  /// No description provided for @otpResentSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Code sent again'**
  String get otpResentSnackbar;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsTitle;

  /// No description provided for @termsBody.
  ///
  /// In en, this message translates to:
  /// **'This is the Terms & Conditions page for the app. By using this app, you agree to follow the usage policies, respect platform rules, and keep your account information confidential. This page will be updated with final legal content later.'**
  String get termsBody;

  /// No description provided for @onboardingTitleLine1.
  ///
  /// In en, this message translates to:
  /// **'Order more, wait less …'**
  String get onboardingTitleLine1;

  /// No description provided for @onboardingTitleAccent.
  ///
  /// In en, this message translates to:
  /// **' Order now'**
  String get onboardingTitleAccent;

  /// No description provided for @onboardingDescription.
  ///
  /// In en, this message translates to:
  /// **'Faster delivery, more options, and an experience designed\nfor your comfort with every order.'**
  String get onboardingDescription;

  /// No description provided for @onboardingCta.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get onboardingCta;

  /// No description provided for @mainTabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get mainTabHome;

  /// No description provided for @mainTabCart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get mainTabCart;

  /// No description provided for @mainTabOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get mainTabOrders;

  /// No description provided for @mainTabAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get mainTabAccount;

  /// No description provided for @accountTitle.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get accountTitle;

  /// No description provided for @accountPlaceholderName.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Farag'**
  String get accountPlaceholderName;

  /// No description provided for @accountPlaceholderEmail.
  ///
  /// In en, this message translates to:
  /// **'afarag74@gmail.com'**
  String get accountPlaceholderEmail;

  /// No description provided for @accountGeneralSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get accountGeneralSettings;

  /// No description provided for @accountFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get accountFavorites;

  /// No description provided for @accountDiscountPoints.
  ///
  /// In en, this message translates to:
  /// **'Discount Points'**
  String get accountDiscountPoints;

  /// No description provided for @accountSavedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get accountSavedAddresses;

  /// No description provided for @accountCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get accountCards;

  /// No description provided for @accountTechnicalSupport.
  ///
  /// In en, this message translates to:
  /// **'Technical Support'**
  String get accountTechnicalSupport;

  /// No description provided for @accountTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get accountTermsAndConditions;

  /// No description provided for @accountLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get accountLogout;

  /// No description provided for @accountLoggingOut.
  ///
  /// In en, this message translates to:
  /// **'Logging out...'**
  String get accountLoggingOut;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @favoritesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get favoritesEmptyTitle;

  /// No description provided for @favoritesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Restaurants and meals you save will appear here.'**
  String get favoritesEmptyMessage;

  /// No description provided for @favoriteSampleRestaurant.
  ///
  /// In en, this message translates to:
  /// **'El Kelany Restaurant'**
  String get favoriteSampleRestaurant;

  /// No description provided for @favoriteSampleDescription.
  ///
  /// In en, this message translates to:
  /// **'Grilled meals, sandwiches, and fast delivery'**
  String get favoriteSampleDescription;

  /// No description provided for @favoriteSampleMeal.
  ///
  /// In en, this message translates to:
  /// **'Grilled Chicken Meal'**
  String get favoriteSampleMeal;

  /// No description provided for @favoriteSampleMealDescription.
  ///
  /// In en, this message translates to:
  /// **'Chicken, rice, salad, and sauce'**
  String get favoriteSampleMealDescription;

  /// No description provided for @favoriteDeliveryTime.
  ///
  /// In en, this message translates to:
  /// **'20 - 30 min'**
  String get favoriteDeliveryTime;

  /// No description provided for @favoriteRating.
  ///
  /// In en, this message translates to:
  /// **'4.8'**
  String get favoriteRating;

  /// No description provided for @favoriteRestaurantAzAlSham.
  ///
  /// In en, this message translates to:
  /// **'Az Al Sham Restaurant'**
  String get favoriteRestaurantAzAlSham;

  /// No description provided for @favoriteStatusAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get favoriteStatusAvailable;

  /// No description provided for @favoriteStatusBusy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get favoriteStatusBusy;

  /// No description provided for @favoriteStatusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get favoriteStatusClosed;

  /// No description provided for @favoriteDeliveryTimeRange.
  ///
  /// In en, this message translates to:
  /// **'30-45 min'**
  String get favoriteDeliveryTimeRange;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// No description provided for @savedAddressesTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddressesTitle;

  /// No description provided for @homeAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeAddressTitle;

  /// No description provided for @workAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get workAddressTitle;

  /// No description provided for @sampleHomeAddress.
  ///
  /// In en, this message translates to:
  /// **'15 Tahrir Street, Dokki, Giza'**
  String get sampleHomeAddress;

  /// No description provided for @sampleWorkAddress.
  ///
  /// In en, this message translates to:
  /// **'12 Nile Corniche, Maadi, Cairo'**
  String get sampleWorkAddress;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addNewAddress;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get deleteAddress;

  /// No description provided for @deleteAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get deleteAddressTitle;

  /// No description provided for @deleteAddressMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this address?'**
  String get deleteAddressMessage;

  /// No description provided for @confirmLocation.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmLocation;

  /// No description provided for @addAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'New Address'**
  String get addAddressTitle;

  /// No description provided for @editAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddressTitle;

  /// No description provided for @saveAddress.
  ///
  /// In en, this message translates to:
  /// **'Confirm Add'**
  String get saveAddress;

  /// No description provided for @updateAddress.
  ///
  /// In en, this message translates to:
  /// **'Confirm Edit'**
  String get updateAddress;

  /// No description provided for @building.
  ///
  /// In en, this message translates to:
  /// **'Building Number'**
  String get building;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartment Number'**
  String get apartment;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floor;

  /// No description provided for @addressSavedDesignOnly.
  ///
  /// In en, this message translates to:
  /// **'Address saved for design preview'**
  String get addressSavedDesignOnly;

  /// No description provided for @addressUpdatedDesignOnly.
  ///
  /// In en, this message translates to:
  /// **'Address updated for design preview'**
  String get addressUpdatedDesignOnly;

  /// No description provided for @chooseLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get chooseLocation;

  /// No description provided for @selectedLocation.
  ///
  /// In en, this message translates to:
  /// **'Your current address'**
  String get selectedLocation;

  /// No description provided for @searchForAddress.
  ///
  /// In en, this message translates to:
  /// **'Search for your location'**
  String get searchForAddress;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get currentLocation;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'New Cairo, Madinaty, Al Zuhour District'**
  String get deliveryAddress;

  /// No description provided for @sampleAddressMeta.
  ///
  /// In en, this message translates to:
  /// **'Building: El Saadany / Apartment: 201 / Floor: Fifth'**
  String get sampleAddressMeta;

  /// No description provided for @apartmentAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get apartmentAddressTitle;

  /// No description provided for @sampleBuildingName.
  ///
  /// In en, this message translates to:
  /// **'El Saadany'**
  String get sampleBuildingName;

  /// No description provided for @sampleApartmentNumber.
  ///
  /// In en, this message translates to:
  /// **'201'**
  String get sampleApartmentNumber;

  /// No description provided for @sampleFloorName.
  ///
  /// In en, this message translates to:
  /// **'Fifth'**
  String get sampleFloorName;

  /// No description provided for @editAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// No description provided for @helpSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupportTitle;

  /// No description provided for @faqTitle.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faqTitle;

  /// No description provided for @supportOrderIssue.
  ///
  /// In en, this message translates to:
  /// **'I have an issue with an order'**
  String get supportOrderIssue;

  /// No description provided for @supportPaymentIssue.
  ///
  /// In en, this message translates to:
  /// **'Payment and refund help'**
  String get supportPaymentIssue;

  /// No description provided for @supportContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get supportContactUs;

  /// No description provided for @supportPhone.
  ///
  /// In en, this message translates to:
  /// **'Call support'**
  String get supportPhone;

  /// No description provided for @supportWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp support'**
  String get supportWhatsapp;

  /// No description provided for @supportEmail.
  ///
  /// In en, this message translates to:
  /// **'Email support'**
  String get supportEmail;

  /// No description provided for @supportChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Support'**
  String get supportChatTitle;

  /// No description provided for @supportToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get supportToday;

  /// No description provided for @supportGoodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get supportGoodEvening;

  /// No description provided for @supportHowCanWeHelp.
  ///
  /// In en, this message translates to:
  /// **'How can we help you?'**
  String get supportHowCanWeHelp;

  /// No description provided for @supportSampleUserIssue.
  ///
  /// In en, this message translates to:
  /// **'I have a problem with Az Al Sham Restaurant. The food was delayed beyond the expected time.'**
  String get supportSampleUserIssue;

  /// No description provided for @supportInputHint.
  ///
  /// In en, this message translates to:
  /// **'Write here...'**
  String get supportInputHint;

  /// No description provided for @supportAttachmentOptions.
  ///
  /// In en, this message translates to:
  /// **'Attachment options'**
  String get supportAttachmentOptions;

  /// No description provided for @supportPickImage.
  ///
  /// In en, this message translates to:
  /// **'Pick Image'**
  String get supportPickImage;

  /// No description provided for @supportPickVideo.
  ///
  /// In en, this message translates to:
  /// **'Pick Video'**
  String get supportPickVideo;

  /// No description provided for @supportCancelAttachment.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get supportCancelAttachment;

  /// No description provided for @supportImageMessage.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get supportImageMessage;

  /// No description provided for @supportVideoMessage.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get supportVideoMessage;

  /// No description provided for @cardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cardsTitle;

  /// No description provided for @paymentMethodsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethodsTitle;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCard;

  /// No description provided for @sampleCardHolder.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Farag'**
  String get sampleCardHolder;

  /// No description provided for @paymentCardEnding.
  ///
  /// In en, this message translates to:
  /// **'Visa ending in 4242'**
  String get paymentCardEnding;

  /// No description provided for @paymentIntegrationComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Payment card saving is coming soon.'**
  String get paymentIntegrationComingSoon;

  /// No description provided for @editProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Personal Data'**
  String get editProfileTitle;

  /// No description provided for @personalDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get personalDataTitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @profileChangesSaved.
  ///
  /// In en, this message translates to:
  /// **'Changes saved for design preview'**
  String get profileChangesSaved;

  /// No description provided for @socialDivider.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get socialDivider;

  /// No description provided for @socialAppleSoon.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple is coming soon'**
  String get socialAppleSoon;

  /// No description provided for @socialGoogleSoon.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google is coming soon'**
  String get socialGoogleSoon;

  /// No description provided for @socialAppleLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get socialAppleLabel;

  /// No description provided for @socialGoogleLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get socialGoogleLabel;

  /// No description provided for @validationEmailRequiredDotComRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get validationEmailRequiredDotComRequired;

  /// No description provided for @validationEmailRequiredDotComInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get validationEmailRequiredDotComInvalid;

  /// No description provided for @validationEmailRequiredDotComNeedsCom.
  ///
  /// In en, this message translates to:
  /// **'Email must end with .com'**
  String get validationEmailRequiredDotComNeedsCom;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get validationPasswordRequired;

  /// No description provided for @validationPasswordMin8.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get validationPasswordMin8;

  /// No description provided for @validationUsernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get validationUsernameRequired;

  /// No description provided for @validationUsernameMin3.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters'**
  String get validationUsernameMin3;

  /// No description provided for @validationPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Mobile number is required'**
  String get validationPhoneRequired;

  /// No description provided for @validationPhoneEgyptian.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Egyptian mobile number (10 or 11 digits after +20)'**
  String get validationPhoneEgyptian;

  /// No description provided for @validationConfirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation is required'**
  String get validationConfirmPasswordRequired;

  /// No description provided for @validationConfirmPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validationConfirmPasswordMismatch;

  /// No description provided for @validationOtpRequired.
  ///
  /// In en, this message translates to:
  /// **'Verification code is required'**
  String get validationOtpRequired;

  /// No description provided for @validationOtpSixDigits.
  ///
  /// In en, this message translates to:
  /// **'Please enter 6 digits'**
  String get validationOtpSixDigits;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
