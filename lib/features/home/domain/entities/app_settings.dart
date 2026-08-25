import 'package:equatable/equatable.dart';

/// App-wide settings returned by `GET /api/v1/general-settings`.
class AppSettings extends Equatable {
  final String locale;
  final String websiteName;
  final String? contactNumber;
  final String? contactMail;
  final String? logo;
  final String? favicon;
  final String? copyRight;
  final String? androidVersion;
  final String? iosVersion;
  final String? commercialRegister;
  final String? taxNumber;
  final String? applicationTaxPrice;
  final String? motorcycleDeliveryPrice;
  final String? regularBikeDeliveryPrice;
  final String? terms;
  final String? privacyPolicy;
  final String? aboutUs;
  final List<SocialLink> socialLinks;

  const AppSettings({
    required this.locale,
    required this.websiteName,
    this.contactNumber,
    this.contactMail,
    this.logo,
    this.favicon,
    this.copyRight,
    this.androidVersion,
    this.iosVersion,
    this.commercialRegister,
    this.taxNumber,
    this.applicationTaxPrice,
    this.motorcycleDeliveryPrice,
    this.regularBikeDeliveryPrice,
    this.terms,
    this.privacyPolicy,
    this.aboutUs,
    this.socialLinks = const [],
  });

  @override
  List<Object?> get props => [locale, websiteName];
}

class SocialLink extends Equatable {
  final String key;
  final String url;
  final String? icon;

  const SocialLink({required this.key, required this.url, this.icon});

  @override
  List<Object?> get props => [key, url, icon];
}
