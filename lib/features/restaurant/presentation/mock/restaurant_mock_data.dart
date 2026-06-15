import 'package:flutter/material.dart';

import 'package:food_user_app/core/constants/app_assets.dart';

class MockRestaurant {
  const MockRestaurant({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.deliveryTimeAr,
    required this.deliveryTimeEn,
    required this.deliveryFeeAr,
    required this.deliveryFeeEn,
    required this.rating,
    required this.ratingCount,
    required this.logoAsset,
    required this.coverAsset,
    required this.categoriesAr,
    required this.categoriesEn,
    required this.menu,
    required this.reviews,
  });

  final String id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final String deliveryTimeAr;
  final String deliveryTimeEn;
  final String deliveryFeeAr;
  final String deliveryFeeEn;
  final double rating;
  final String ratingCount;
  final String logoAsset;
  final String coverAsset;
  final List<String> categoriesAr;
  final List<String> categoriesEn;
  final List<MockMenuItem> menu;
  final List<MockReview> reviews;

  String name(Locale locale) => locale.languageCode == 'ar' ? nameAr : nameEn;
  String description(Locale locale) =>
      locale.languageCode == 'ar' ? descriptionAr : descriptionEn;
  String deliveryTime(Locale locale) =>
      locale.languageCode == 'ar' ? deliveryTimeAr : deliveryTimeEn;
  String deliveryFee(Locale locale) =>
      locale.languageCode == 'ar' ? deliveryFeeAr : deliveryFeeEn;
  List<String> categories(Locale locale) =>
      locale.languageCode == 'ar' ? categoriesAr : categoriesEn;
}

class MockMenuItem {
  const MockMenuItem({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
    required this.priceAr,
    required this.priceEn,
    required this.imageAsset,
    required this.keywordsAr,
    required this.keywordsEn,
  });

  final String id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final int price;
  final String priceAr;
  final String priceEn;
  final String imageAsset;
  final List<String> keywordsAr;
  final List<String> keywordsEn;

  String name(Locale locale) => locale.languageCode == 'ar' ? nameAr : nameEn;
  String description(Locale locale) =>
      locale.languageCode == 'ar' ? descriptionAr : descriptionEn;
  String priceLabel(Locale locale) =>
      locale.languageCode == 'ar' ? priceAr : priceEn;
  List<String> keywords(Locale locale) =>
      locale.languageCode == 'ar' ? keywordsAr : keywordsEn;
}

class MockReview {
  const MockReview({
    required this.nameAr,
    required this.nameEn,
    required this.date,
    required this.commentAr,
    required this.commentEn,
    required this.rating,
  });

  final String nameAr;
  final String nameEn;
  final String date;
  final String commentAr;
  final String commentEn;
  final int rating;

  String name(Locale locale) => locale.languageCode == 'ar' ? nameAr : nameEn;
  String comment(Locale locale) =>
      locale.languageCode == 'ar' ? commentAr : commentEn;
}

const mockRestaurant = MockRestaurant(
  id: 'az-al-sham',
  nameAr: 'مطعم عز الشام',
  nameEn: 'Az Al Sham Restaurant',
  descriptionAr: 'شاورما، بيتزا، وجبات شرقي',
  descriptionEn: 'Shawarma, pizza, oriental meals',
  deliveryTimeAr: '45-30 دقيقة',
  deliveryTimeEn: '30-45 min',
  deliveryFeeAr: '20 ج.م',
  deliveryFeeEn: 'EGP 20',
  rating: 4.5,
  ratingCount: '+1K',
  logoAsset: AppAssets.orderRestaurantAvatar,
  coverAsset: AppAssets.productBurgerCombo,
  categoriesAr: ['كل الوجبات', 'بيتزا', 'سندوتشات', 'الشاورما', 'مشويات'],
  categoriesEn: ['All meals', 'Pizza', 'Sandwiches', 'Shawarma', 'Grills'],
  menu: [
    MockMenuItem(
      id: 'burger-fries',
      nameAr: 'عرض البرجر مع الفرايز',
      nameEn: 'Burger with fries offer',
      descriptionAr: 'برجر لحم مع فرايز وصوص خاص',
      descriptionEn: 'Beef burger with fries and special sauce',
      price: 190,
      priceAr: '190 ج.م',
      priceEn: 'EGP 190',
      imageAsset: AppAssets.productBurgerCombo,
      keywordsAr: ['برجر', 'فرايز', 'عرض', 'سندوتشات'],
      keywordsEn: ['burger', 'fries', 'offer', 'sandwiches'],
    ),
    MockMenuItem(
      id: 'burger-combo',
      nameAr: 'عرض البرجر',
      nameEn: 'Burger offer',
      descriptionAr: 'ساندوتش برجر مع مشروب',
      descriptionEn: 'Burger sandwich with a drink',
      price: 190,
      priceAr: '190 ج.م',
      priceEn: 'EGP 190',
      imageAsset: AppAssets.cartProductImage,
      keywordsAr: ['برجر', 'مشروب', 'وجبات'],
      keywordsEn: ['burger', 'drink', 'meals'],
    ),
    MockMenuItem(
      id: 'shawarma',
      nameAr: 'شاورما دجاج',
      nameEn: 'Chicken shawarma',
      descriptionAr: 'شاورما دجاج مع ثومية ومخلل',
      descriptionEn: 'Chicken shawarma with garlic sauce and pickles',
      price: 120,
      priceAr: '120 ج.م',
      priceEn: 'EGP 120',
      imageAsset: AppAssets.orderProductImage,
      keywordsAr: ['شاورما', 'دجاج', 'سندوتشات'],
      keywordsEn: ['shawarma', 'chicken', 'sandwiches'],
    ),
    MockMenuItem(
      id: 'grills',
      nameAr: 'وجبة مشاوي',
      nameEn: 'Grill meal',
      descriptionAr: 'مشويات شرقي مع أرز وسلطة',
      descriptionEn: 'Oriental grills with rice and salad',
      price: 260,
      priceAr: '260 ج.م',
      priceEn: 'EGP 260',
      imageAsset: AppAssets.favoriteRestaurantAzAlSham,
      keywordsAr: ['مشويات', 'وجبة', 'شرقي'],
      keywordsEn: ['grills', 'meal', 'oriental'],
    ),
  ],
  reviews: [
    MockReview(
      nameAr: 'احمد محمد',
      nameEn: 'Ahmed Mohamed',
      date: '2026/6/6',
      commentAr: 'الاكل هنا جميل جداً انصح بالتعامل مع المطعم ده',
      commentEn: 'The food here is excellent. I recommend this restaurant.',
      rating: 5,
    ),
    MockReview(
      nameAr: 'سارة علي',
      nameEn: 'Sara Ali',
      date: '2026/6/7',
      commentAr: 'الخدمة كانت سريعة والجو مريح جداً',
      commentEn: 'The service was fast and the experience was comfortable.',
      rating: 5,
    ),
    MockReview(
      nameAr: 'يوسف كريم',
      nameEn: 'Youssef Karim',
      date: '2026/6/8',
      commentAr: 'تجربة رائعة، الطعام لذيذ والأسعار مناسبة',
      commentEn: 'Great experience, tasty food, and fair prices.',
      rating: 5,
    ),
    MockReview(
      nameAr: 'مريم حسن',
      nameEn: 'Mariam Hassan',
      date: '2026/6/9',
      commentAr: 'أحببت الحلويات، كانت شهية جداً ومميزة',
      commentEn: 'I loved the desserts. They were delicious and special.',
      rating: 5,
    ),
    MockReview(
      nameAr: 'علي سمير',
      nameEn: 'Ali Samir',
      date: '2026/6/10',
      commentAr: 'الاكل نظيف جداً وسخن',
      commentEn: 'The food was very clean and hot.',
      rating: 5,
    ),
    MockReview(
      nameAr: 'فاطمة زكريا',
      nameEn: 'Fatma Zakaria',
      date: '2026/6/11',
      commentAr: 'أوصي بتجربة المشاوي، كانت رائعة ولذيذة',
      commentEn: 'Try the grills. They were excellent and tasty.',
      rating: 5,
    ),
  ],
);
