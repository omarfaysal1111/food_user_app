import json

def update_arb(file_path, new_entries):
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    for k, v in new_entries.items():
        data[k] = v

    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

en_entries = {
    "searchClearAll": "Clear All",
    "searchClearHistoryConfirm": "Are you sure you want to clear your search history?",
    "cancel": "Cancel",
    "clear": "Clear"
}

ar_entries = {
    "searchClearAll": "مسح الكل",
    "searchClearHistoryConfirm": "هل أنت متأكد أنك تريد مسح سجل البحث؟",
    "cancel": "إلغاء",
    "clear": "مسح"
}

update_arb('lib/l10n/app_en.arb', en_entries)
update_arb('lib/l10n/app_ar.arb', ar_entries)
