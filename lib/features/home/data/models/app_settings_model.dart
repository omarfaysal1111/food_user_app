import 'package:food_user_app/features/home/domain/entities/app_settings.dart';

/// Data model for `GET /api/v1/general-settings`.
///
/// API shape inside unified envelope `{ status, msg, data }`:
/// ```json
/// {
///   "locale": "ar",
///   "website_name": "بليزمو",
///   "contact_number": "01000000000",
///   "contact_mail": "admin@plezmo.test",
///   "logo": null,
///   "favicon": null,
///   "copy_right": "جميع الحقوق محفوظة © 2026",
///   "android_version": "1.0.0",
///   "ios_version": "1.0.0",
///   "commercial_register": "",
///   "tax_number": "",
///   "application_tax_price": "0.00",
///   "motorcycle_delivery_price": "0.00",
///   "regular_bike_delivery_price": "0.00",
///   "terms": "<p>الشروط</p>",
///   "privacy_policy": "<p>سياسة الخصوصية</p>",
///   "about_us": "<p>من نحن</p>",
///   "social_links": [{ "key": "whatsapp_link", "url": "...", "icon": null }]
/// }
/// ```
class AppSettingsModel extends AppSettings {
  const AppSettingsModel({
    required super.locale,
    required super.websiteName,
    super.contactNumber,
    super.contactMail,
    super.logo,
    super.favicon,
    super.copyRight,
    super.androidVersion,
    super.iosVersion,
    super.commercialRegister,
    super.taxNumber,
    super.applicationTaxPrice,
    super.motorcycleDeliveryPrice,
    super.regularBikeDeliveryPrice,
    super.terms,
    super.privacyPolicy,
    super.aboutUs,
    super.socialLinks,
  });

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) {
    String? s(String key) {
      final v = json[key];
      if (v == null) return null;
      final str = v.toString().trim();
      return str.isEmpty ? null : str;
    }

    final rawLinks = json['social_links'];
    final links = rawLinks is List
        ? rawLinks.whereType<Map<String, dynamic>>().map((l) {
            return SocialLink(
              key: l['key']?.toString() ?? '',
              url: l['url']?.toString() ?? '',
              icon: l['icon']?.toString(),
            );
          }).toList()
        : <SocialLink>[];

    return AppSettingsModel(
      locale: s('locale') ?? 'ar',
      websiteName: s('website_name') ?? '',
      contactNumber: s('contact_number'),
      contactMail: s('contact_mail'),
      logo: s('logo'),
      favicon: s('favicon'),
      copyRight: s('copy_right'),
      androidVersion: s('android_version'),
      iosVersion: s('ios_version'),
      commercialRegister: s('commercial_register'),
      taxNumber: s('tax_number'),
      applicationTaxPrice: s('application_tax_price'),
      motorcycleDeliveryPrice: s('motorcycle_delivery_price'),
      regularBikeDeliveryPrice: s('regular_bike_delivery_price'),
      terms: s('terms'),
      privacyPolicy: s('privacy_policy'),
      aboutUs: s('about_us'),
      socialLinks: links,
    );
  }
}
