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
    required this.minimumOrderAr,
    required this.minimumOrderEn,
    required this.addressAr,
    required this.addressEn,
    required this.previousOrdersAr,
    required this.previousOrdersEn,
    required this.rating,
    required this.ratingCount,
    required this.logoAsset,
    required this.coverAsset,
    required this.categoriesAr,
    required this.categoriesEn,
    required this.menu,
    required this.menuSections,
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
  final String minimumOrderAr;
  final String minimumOrderEn;
  final String addressAr;
  final String addressEn;
  final String previousOrdersAr;
  final String previousOrdersEn;
  final double rating;
  final String ratingCount;
  final String logoAsset;
  final String coverAsset;
  final List<String> categoriesAr;
  final List<String> categoriesEn;
  final List<MockMenuItem> menu;
  final List<MockMenuSection> menuSections;
  final List<MockReview> reviews;

  String name(Locale locale) => locale.languageCode == 'ar' ? nameAr : nameEn;
  String description(Locale locale) =>
      locale.languageCode == 'ar' ? descriptionAr : descriptionEn;
  String deliveryTime(Locale locale) =>
      locale.languageCode == 'ar' ? deliveryTimeAr : deliveryTimeEn;
  String deliveryFee(Locale locale) =>
      locale.languageCode == 'ar' ? deliveryFeeAr : deliveryFeeEn;
  String minimumOrder(Locale locale) =>
      locale.languageCode == 'ar' ? minimumOrderAr : minimumOrderEn;
  String address(Locale locale) =>
      locale.languageCode == 'ar' ? addressAr : addressEn;
  String previousOrders(Locale locale) =>
      locale.languageCode == 'ar' ? previousOrdersAr : previousOrdersEn;
  List<String> categories(Locale locale) =>
      locale.languageCode == 'ar' ? categoriesAr : categoriesEn;
}

class MockMenuSection {
  const MockMenuSection({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.items,
  });

  final String id;
  final String titleAr;
  final String titleEn;
  final List<MockMenuItem> items;

  String title(Locale locale) =>
      locale.languageCode == 'ar' ? titleAr : titleEn;
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
  minimumOrderAr: '170 ج.م',
  minimumOrderEn: 'EGP 170',
  addressAr: 'مدينتي ، حي الزهور',
  addressEn: 'Madinaty, Al Zohour District',
  previousOrdersAr: 'لم تقم',
  previousOrdersEn: 'No previous orders',
  rating: 4.5,
  ratingCount: '+1K',
  logoAsset: AppAssets.restaurantAzAlShamLogo,
  coverAsset: AppAssets.restaurantHeroBurger,
  categoriesAr: [
    'العروض',
    'بيتزا',
    'سندوتشات',
    'الشاورما',
    'مشويات',
    'المقبلات',
    'المشروبات',
  ],
  categoriesEn: [
    'Offers',
    'Pizza',
    'Sandwiches',
    'Shawarma',
    'Grills',
    'Appetizers',
    'Drinks',
  ],
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
      imageAsset: AppAssets.restaurantMenuBurgerFries1,
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
      imageAsset: AppAssets.restaurantMenuBurgerFries2,
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
      imageAsset: AppAssets.restaurantMenuBurgerFries3,
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
      imageAsset: AppAssets.restaurantMenuBurgerFries1,
      keywordsAr: ['مشويات', 'وجبة', 'شرقي'],
      keywordsEn: ['grills', 'meal', 'oriental'],
    ),
  ],
  menuSections: [
    MockMenuSection(
      id: 'offers',
      titleAr: 'العروض',
      titleEn: 'Offers',
      items: [
        MockMenuItem(
          id: 'offer-burger-fries',
          nameAr: 'عرض البرجر مع الفرايز',
          nameEn: 'Burger with fries offer',
          descriptionAr: 'برجر لحم مع فرايز وصوص خاص',
          descriptionEn: 'Beef burger with fries and special sauce',
          price: 190,
          priceAr: '190 ج.م',
          priceEn: 'EGP 190',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['عرض', 'برجر', 'فرايز'],
          keywordsEn: ['offer', 'burger', 'fries'],
        ),
        MockMenuItem(
          id: 'offer-double-burger',
          nameAr: 'عرض دبل برجر',
          nameEn: 'Double burger offer',
          descriptionAr: 'ساندوتشين برجر مع فرايز',
          descriptionEn: 'Two burger sandwiches with fries',
          price: 310,
          priceAr: '310 ج.م',
          priceEn: 'EGP 310',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['عرض', 'برجر'],
          keywordsEn: ['offer', 'burger'],
        ),
        MockMenuItem(
          id: 'offer-family',
          nameAr: 'عرض العيلة',
          nameEn: 'Family offer',
          descriptionAr: 'وجبة عائلية تكفي 4 أفراد',
          descriptionEn: 'Family meal for 4 people',
          price: 520,
          priceAr: '520 ج.م',
          priceEn: 'EGP 520',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['عرض', 'عائلي'],
          keywordsEn: ['offer', 'family'],
        ),
        MockMenuItem(
          id: 'offer-shawarma',
          nameAr: 'عرض الشاورما',
          nameEn: 'Shawarma offer',
          descriptionAr: '2 شاورما دجاج مع بطاطس',
          descriptionEn: '2 chicken shawarma with fries',
          price: 220,
          priceAr: '220 ج.م',
          priceEn: 'EGP 220',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['عرض', 'شاورما'],
          keywordsEn: ['offer', 'shawarma'],
        ),
        MockMenuItem(
          id: 'offer-pizza',
          nameAr: 'عرض البيتزا',
          nameEn: 'Pizza offer',
          descriptionAr: 'بيتزا وسط مع مشروب',
          descriptionEn: 'Medium pizza with drink',
          price: 240,
          priceAr: '240 ج.م',
          priceEn: 'EGP 240',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['عرض', 'بيتزا'],
          keywordsEn: ['offer', 'pizza'],
        ),
        MockMenuItem(
          id: 'offer-grill',
          nameAr: 'عرض المشويات',
          nameEn: 'Grill offer',
          descriptionAr: 'مشويات مشكلة مع أرز وسلطة',
          descriptionEn: 'Mixed grills with rice and salad',
          price: 360,
          priceAr: '360 ج.م',
          priceEn: 'EGP 360',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['عرض', 'مشويات'],
          keywordsEn: ['offer', 'grills'],
        ),
      ],
    ),
    MockMenuSection(
      id: 'pizza',
      titleAr: 'بيتزا',
      titleEn: 'Pizza',
      items: [
        MockMenuItem(
          id: 'pizza-margherita',
          nameAr: 'بيتزا مارجريتا',
          nameEn: 'Margherita pizza',
          descriptionAr: 'جبنة موتزاريلا وصلصة طماطم',
          descriptionEn: 'Mozzarella cheese and tomato sauce',
          price: 180,
          priceAr: '180 ج.م',
          priceEn: 'EGP 180',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['بيتزا'],
          keywordsEn: ['pizza'],
        ),
        MockMenuItem(
          id: 'pizza-chicken',
          nameAr: 'بيتزا دجاج',
          nameEn: 'Chicken pizza',
          descriptionAr: 'قطع دجاج وخضار وجبنة',
          descriptionEn: 'Chicken, vegetables, and cheese',
          price: 230,
          priceAr: '230 ج.م',
          priceEn: 'EGP 230',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['بيتزا', 'دجاج'],
          keywordsEn: ['pizza', 'chicken'],
        ),
        MockMenuItem(
          id: 'pizza-pepperoni',
          nameAr: 'بيتزا بيبروني',
          nameEn: 'Pepperoni pizza',
          descriptionAr: 'بيبروني وجبنة موتزاريلا',
          descriptionEn: 'Pepperoni and mozzarella',
          price: 250,
          priceAr: '250 ج.م',
          priceEn: 'EGP 250',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['بيتزا'],
          keywordsEn: ['pizza'],
        ),
        MockMenuItem(
          id: 'pizza-vegetables',
          nameAr: 'بيتزا خضار',
          nameEn: 'Vegetables pizza',
          descriptionAr: 'فلفل وزيتون ومشروم',
          descriptionEn: 'Pepper, olives, and mushrooms',
          price: 200,
          priceAr: '200 ج.م',
          priceEn: 'EGP 200',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['بيتزا', 'خضار'],
          keywordsEn: ['pizza', 'vegetables'],
        ),
        MockMenuItem(
          id: 'pizza-mixed-cheese',
          nameAr: 'بيتزا أجبان',
          nameEn: 'Mixed cheese pizza',
          descriptionAr: 'خليط أجبان مع صوص خاص',
          descriptionEn: 'Mixed cheese with special sauce',
          price: 220,
          priceAr: '220 ج.م',
          priceEn: 'EGP 220',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['بيتزا', 'جبنة'],
          keywordsEn: ['pizza', 'cheese'],
        ),
        MockMenuItem(
          id: 'pizza-supreme',
          nameAr: 'بيتزا سوبريم',
          nameEn: 'Supreme pizza',
          descriptionAr: 'لحوم وخضار وجبنة',
          descriptionEn: 'Meat, vegetables, and cheese',
          price: 280,
          priceAr: '280 ج.م',
          priceEn: 'EGP 280',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['بيتزا'],
          keywordsEn: ['pizza'],
        ),
      ],
    ),
    MockMenuSection(
      id: 'sandwiches',
      titleAr: 'سندوتشات',
      titleEn: 'Sandwiches',
      items: [
        MockMenuItem(
          id: 'sandwich-burger',
          nameAr: 'ساندوتش برجر',
          nameEn: 'Burger sandwich',
          descriptionAr: 'برجر لحم مع صوص خاص',
          descriptionEn: 'Beef burger with special sauce',
          price: 150,
          priceAr: '150 ج.م',
          priceEn: 'EGP 150',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['سندوتشات', 'برجر'],
          keywordsEn: ['sandwiches', 'burger'],
        ),
        MockMenuItem(
          id: 'sandwich-crispy',
          nameAr: 'ساندوتش كرسبي',
          nameEn: 'Crispy sandwich',
          descriptionAr: 'دجاج كرسبي مع خس وصوص',
          descriptionEn: 'Crispy chicken with lettuce and sauce',
          price: 135,
          priceAr: '135 ج.م',
          priceEn: 'EGP 135',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['سندوتشات', 'دجاج'],
          keywordsEn: ['sandwiches', 'chicken'],
        ),
        MockMenuItem(
          id: 'sandwich-fajita',
          nameAr: 'ساندوتش فاهيتا',
          nameEn: 'Fajita sandwich',
          descriptionAr: 'دجاج فاهيتا وفلفل ملون',
          descriptionEn: 'Chicken fajita and peppers',
          price: 145,
          priceAr: '145 ج.م',
          priceEn: 'EGP 145',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['سندوتشات'],
          keywordsEn: ['sandwiches'],
        ),
        MockMenuItem(
          id: 'sandwich-kofta',
          nameAr: 'ساندوتش كفتة',
          nameEn: 'Kofta sandwich',
          descriptionAr: 'كفتة مشوية مع طحينة',
          descriptionEn: 'Grilled kofta with tahini',
          price: 160,
          priceAr: '160 ج.م',
          priceEn: 'EGP 160',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['سندوتشات', 'كفتة'],
          keywordsEn: ['sandwiches', 'kofta'],
        ),
        MockMenuItem(
          id: 'sandwich-sausage',
          nameAr: 'ساندوتش سجق',
          nameEn: 'Sausage sandwich',
          descriptionAr: 'سجق شرقي مع فلفل',
          descriptionEn: 'Oriental sausage with pepper',
          price: 140,
          priceAr: '140 ج.م',
          priceEn: 'EGP 140',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['سندوتشات', 'سجق'],
          keywordsEn: ['sandwiches', 'sausage'],
        ),
        MockMenuItem(
          id: 'sandwich-pane',
          nameAr: 'ساندوتش بانيه',
          nameEn: 'Pane sandwich',
          descriptionAr: 'دجاج بانيه مع مايونيز',
          descriptionEn: 'Chicken pane with mayonnaise',
          price: 130,
          priceAr: '130 ج.م',
          priceEn: 'EGP 130',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['سندوتشات', 'دجاج'],
          keywordsEn: ['sandwiches', 'chicken'],
        ),
      ],
    ),
    MockMenuSection(
      id: 'shawarma',
      titleAr: 'الشاورما',
      titleEn: 'Shawarma',
      items: [
        MockMenuItem(
          id: 'shawarma-chicken',
          nameAr: 'شاورما دجاج',
          nameEn: 'Chicken shawarma',
          descriptionAr: 'شاورما دجاج مع ثومية',
          descriptionEn: 'Chicken shawarma with garlic sauce',
          price: 120,
          priceAr: '120 ج.م',
          priceEn: 'EGP 120',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['شاورما', 'دجاج'],
          keywordsEn: ['shawarma', 'chicken'],
        ),
        MockMenuItem(
          id: 'shawarma-beef',
          nameAr: 'شاورما لحم',
          nameEn: 'Beef shawarma',
          descriptionAr: 'شاورما لحم مع طحينة',
          descriptionEn: 'Beef shawarma with tahini',
          price: 150,
          priceAr: '150 ج.م',
          priceEn: 'EGP 150',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['شاورما', 'لحم'],
          keywordsEn: ['shawarma', 'beef'],
        ),
        MockMenuItem(
          id: 'shawarma-plate',
          nameAr: 'طبق شاورما',
          nameEn: 'Shawarma plate',
          descriptionAr: 'شاورما مع أرز وبطاطس',
          descriptionEn: 'Shawarma with rice and fries',
          price: 210,
          priceAr: '210 ج.م',
          priceEn: 'EGP 210',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['شاورما', 'طبق'],
          keywordsEn: ['shawarma', 'plate'],
        ),
        MockMenuItem(
          id: 'shawarma-box',
          nameAr: 'بوكس شاورما',
          nameEn: 'Shawarma box',
          descriptionAr: 'قطع شاورما وبطاطس وصوص',
          descriptionEn: 'Shawarma pieces, fries, and sauce',
          price: 180,
          priceAr: '180 ج.م',
          priceEn: 'EGP 180',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['شاورما'],
          keywordsEn: ['shawarma'],
        ),
        MockMenuItem(
          id: 'shawarma-wrap',
          nameAr: 'راب شاورما',
          nameEn: 'Shawarma wrap',
          descriptionAr: 'راب دجاج مع خضار',
          descriptionEn: 'Chicken wrap with vegetables',
          price: 135,
          priceAr: '135 ج.م',
          priceEn: 'EGP 135',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['شاورما', 'راب'],
          keywordsEn: ['shawarma', 'wrap'],
        ),
        MockMenuItem(
          id: 'shawarma-extra',
          nameAr: 'شاورما اكسترا',
          nameEn: 'Extra shawarma',
          descriptionAr: 'شاورما دجاج اكسترا',
          descriptionEn: 'Extra chicken shawarma',
          price: 170,
          priceAr: '170 ج.م',
          priceEn: 'EGP 170',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['شاورما'],
          keywordsEn: ['shawarma'],
        ),
      ],
    ),
    MockMenuSection(
      id: 'grills',
      titleAr: 'مشويات',
      titleEn: 'Grills',
      items: [
        MockMenuItem(
          id: 'grill-mix',
          nameAr: 'مشويات مشكلة',
          nameEn: 'Mixed grills',
          descriptionAr: 'كفتة وكباب وشيش طاووق',
          descriptionEn: 'Kofta, kebab, and shish tawook',
          price: 330,
          priceAr: '330 ج.م',
          priceEn: 'EGP 330',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['مشويات'],
          keywordsEn: ['grills'],
        ),
        MockMenuItem(
          id: 'grill-kofta',
          nameAr: 'كفتة مشوية',
          nameEn: 'Grilled kofta',
          descriptionAr: 'كفتة مع أرز وسلطة',
          descriptionEn: 'Kofta with rice and salad',
          price: 240,
          priceAr: '240 ج.م',
          priceEn: 'EGP 240',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['مشويات', 'كفتة'],
          keywordsEn: ['grills', 'kofta'],
        ),
        MockMenuItem(
          id: 'grill-kebab',
          nameAr: 'كباب مشوي',
          nameEn: 'Grilled kebab',
          descriptionAr: 'كباب لحم مع طحينة',
          descriptionEn: 'Beef kebab with tahini',
          price: 290,
          priceAr: '290 ج.م',
          priceEn: 'EGP 290',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['مشويات', 'كباب'],
          keywordsEn: ['grills', 'kebab'],
        ),
        MockMenuItem(
          id: 'grill-chicken',
          nameAr: 'فراخ مشوية',
          nameEn: 'Grilled chicken',
          descriptionAr: 'نصف فرخة مع أرز',
          descriptionEn: 'Half chicken with rice',
          price: 260,
          priceAr: '260 ج.م',
          priceEn: 'EGP 260',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['مشويات', 'دجاج'],
          keywordsEn: ['grills', 'chicken'],
        ),
        MockMenuItem(
          id: 'grill-tawook',
          nameAr: 'شيش طاووق',
          nameEn: 'Shish tawook',
          descriptionAr: 'قطع دجاج مشوية',
          descriptionEn: 'Grilled chicken pieces',
          price: 230,
          priceAr: '230 ج.م',
          priceEn: 'EGP 230',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['مشويات', 'دجاج'],
          keywordsEn: ['grills', 'chicken'],
        ),
        MockMenuItem(
          id: 'grill-ribs',
          nameAr: 'ريش مشوية',
          nameEn: 'Grilled ribs',
          descriptionAr: 'ريش لحم مع بطاطس',
          descriptionEn: 'Beef ribs with fries',
          price: 390,
          priceAr: '390 ج.م',
          priceEn: 'EGP 390',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['مشويات', 'لحم'],
          keywordsEn: ['grills', 'beef'],
        ),
      ],
    ),
    MockMenuSection(
      id: 'appetizers',
      titleAr: 'المقبلات',
      titleEn: 'Appetizers',
      items: [
        MockMenuItem(
          id: 'appetizer-fries',
          nameAr: 'بطاطس مقلية',
          nameEn: 'French fries',
          descriptionAr: 'بطاطس مقرمشة مع صوص',
          descriptionEn: 'Crispy fries with sauce',
          price: 65,
          priceAr: '65 ج.م',
          priceEn: 'EGP 65',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['مقبلات', 'بطاطس'],
          keywordsEn: ['appetizers', 'fries'],
        ),
        MockMenuItem(
          id: 'appetizer-cheese-fries',
          nameAr: 'بطاطس بالجبنة',
          nameEn: 'Cheese fries',
          descriptionAr: 'بطاطس مع صوص جبنة',
          descriptionEn: 'Fries with cheese sauce',
          price: 90,
          priceAr: '90 ج.م',
          priceEn: 'EGP 90',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['مقبلات', 'بطاطس'],
          keywordsEn: ['appetizers', 'fries'],
        ),
        MockMenuItem(
          id: 'appetizer-garlic-bread',
          nameAr: 'عيش بالثوم',
          nameEn: 'Garlic bread',
          descriptionAr: 'عيش محمص بالثوم والزبدة',
          descriptionEn: 'Toasted bread with garlic butter',
          price: 55,
          priceAr: '55 ج.م',
          priceEn: 'EGP 55',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['مقبلات'],
          keywordsEn: ['appetizers'],
        ),
        MockMenuItem(
          id: 'appetizer-coleslaw',
          nameAr: 'كول سلو',
          nameEn: 'Coleslaw',
          descriptionAr: 'سلطة كول سلو طازجة',
          descriptionEn: 'Fresh coleslaw salad',
          price: 45,
          priceAr: '45 ج.م',
          priceEn: 'EGP 45',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['مقبلات', 'سلطة'],
          keywordsEn: ['appetizers', 'salad'],
        ),
        MockMenuItem(
          id: 'appetizer-onion-rings',
          nameAr: 'حلقات بصل',
          nameEn: 'Onion rings',
          descriptionAr: 'حلقات بصل مقرمشة',
          descriptionEn: 'Crispy onion rings',
          price: 70,
          priceAr: '70 ج.م',
          priceEn: 'EGP 70',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['مقبلات'],
          keywordsEn: ['appetizers'],
        ),
        MockMenuItem(
          id: 'appetizer-mozzarella',
          nameAr: 'موتزاريلا ستيكس',
          nameEn: 'Mozzarella sticks',
          descriptionAr: 'أصابع موتزاريلا مقلية',
          descriptionEn: 'Fried mozzarella sticks',
          price: 110,
          priceAr: '110 ج.م',
          priceEn: 'EGP 110',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['مقبلات', 'جبنة'],
          keywordsEn: ['appetizers', 'cheese'],
        ),
      ],
    ),
    MockMenuSection(
      id: 'drinks',
      titleAr: 'المشروبات',
      titleEn: 'Drinks',
      items: [
        MockMenuItem(
          id: 'drink-cola',
          nameAr: 'كولا',
          nameEn: 'Cola',
          descriptionAr: 'مشروب غازي بارد',
          descriptionEn: 'Cold soft drink',
          price: 35,
          priceAr: '35 ج.م',
          priceEn: 'EGP 35',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['مشروبات'],
          keywordsEn: ['drinks'],
        ),
        MockMenuItem(
          id: 'drink-orange',
          nameAr: 'عصير برتقال',
          nameEn: 'Orange juice',
          descriptionAr: 'عصير برتقال طازج',
          descriptionEn: 'Fresh orange juice',
          price: 55,
          priceAr: '55 ج.م',
          priceEn: 'EGP 55',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['مشروبات', 'عصير'],
          keywordsEn: ['drinks', 'juice'],
        ),
        MockMenuItem(
          id: 'drink-mango',
          nameAr: 'عصير مانجو',
          nameEn: 'Mango juice',
          descriptionAr: 'عصير مانجو طبيعي',
          descriptionEn: 'Fresh mango juice',
          price: 60,
          priceAr: '60 ج.م',
          priceEn: 'EGP 60',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['مشروبات', 'عصير'],
          keywordsEn: ['drinks', 'juice'],
        ),
        MockMenuItem(
          id: 'drink-water',
          nameAr: 'مياه معدنية',
          nameEn: 'Mineral water',
          descriptionAr: 'زجاجة مياه معدنية',
          descriptionEn: 'Mineral water bottle',
          price: 20,
          priceAr: '20 ج.م',
          priceEn: 'EGP 20',
          imageAsset: AppAssets.restaurantMenuBurgerFries1,
          keywordsAr: ['مشروبات', 'مياه'],
          keywordsEn: ['drinks', 'water'],
        ),
        MockMenuItem(
          id: 'drink-lemon',
          nameAr: 'ليمون نعناع',
          nameEn: 'Mint lemonade',
          descriptionAr: 'ليمون بالنعناع بارد',
          descriptionEn: 'Cold mint lemonade',
          price: 50,
          priceAr: '50 ج.م',
          priceEn: 'EGP 50',
          imageAsset: AppAssets.restaurantMenuBurgerFries2,
          keywordsAr: ['مشروبات'],
          keywordsEn: ['drinks'],
        ),
        MockMenuItem(
          id: 'drink-iced-tea',
          nameAr: 'آيس تي',
          nameEn: 'Iced tea',
          descriptionAr: 'شاي مثلج بنكهة الليمون',
          descriptionEn: 'Lemon flavored iced tea',
          price: 45,
          priceAr: '45 ج.م',
          priceEn: 'EGP 45',
          imageAsset: AppAssets.restaurantMenuBurgerFries3,
          keywordsAr: ['مشروبات'],
          keywordsEn: ['drinks'],
        ),
      ],
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
