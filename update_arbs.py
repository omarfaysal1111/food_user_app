import json

def update_arb(file_path, new_entries):
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    for k, v in new_entries.items():
        if k not in data:
            data[k] = v

    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

en_entries = {
    "orderConfirmedTitle": "Order Confirmed",
    "filterTopRated": "Top Rated",
    "filterMostOrdered": "Most Ordered",
    "filterWithOffers": "With Offers",
    "trackOrderTitle": "Track Order",
    "profileTitle": "Profile",
    "profileNoData": "No profile data",
    "profileNameLabel": "Name: ",
    "profileEmailLabel": "Email: ",
    "profilePhoneLabel": "Phone: ",
    "currencyEgp": "EGP",
    "applyButton": "Apply",
    "cartConflictTitle": "Cart Conflict",
    "cartConflictMessage": "Adding items from a different restaurant will clear your current cart. Continue?",
    "noCategoriesAvailable": "No categories available"
}

ar_entries = {
    "orderConfirmedTitle": "تم تأكيد الطلب",
    "filterTopRated": "الأعلى تقييمًا",
    "filterMostOrdered": "الأكثر طلبًا",
    "filterWithOffers": "مع عروض",
    "trackOrderTitle": "تتبع الطلب",
    "profileTitle": "الملف الشخصي",
    "profileNoData": "لا توجد بيانات للملف الشخصي",
    "profileNameLabel": "الاسم: ",
    "profileEmailLabel": "البريد الإلكتروني: ",
    "profilePhoneLabel": "رقم الهاتف: ",
    "currencyEgp": "ج.م",
    "applyButton": "تطبيق",
    "cartConflictTitle": "تعارض في السلة",
    "cartConflictMessage": "إضافة عناصر من مطعم مختلف ستمسح سلتك الحالية. هل ترغب في المتابعة؟",
    "noCategoriesAvailable": "لا توجد فئات متاحة"
}

update_arb('lib/l10n/app_en.arb', en_entries)
update_arb('lib/l10n/app_ar.arb', ar_entries)
