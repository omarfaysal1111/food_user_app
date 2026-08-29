import re

with open('lib/features/home/domain/entities/store.dart', 'r') as f:
    store_ent = f.read()

# Add fields to Store
if 'final bool hasOffer;' not in store_ent:
    store_ent = store_ent.replace('final List<Tag> tags;', 'final List<Tag> tags;\n  final bool hasOffer;\n  final double? ratingAvg;\n  final int? ratingCount;')
    store_ent = store_ent.replace('this.tags = const [],', 'this.tags = const [],\n    this.hasOffer = false,\n    this.ratingAvg,\n    this.ratingCount,')
    store_ent = store_ent.replace('tags]', 'tags, hasOffer, ratingAvg, ratingCount]')

with open('lib/features/home/domain/entities/store.dart', 'w') as f:
    f.write(store_ent)


with open('lib/features/home/data/models/store_model.dart', 'r') as f:
    store_model = f.read()

# Add fields to StoreModel
if 'super.tags,' in store_model and 'super.hasOffer,' not in store_model:
    store_model = store_model.replace('super.tags,', 'super.tags,\n    super.hasOffer,\n    super.ratingAvg,\n    super.ratingCount,')

# Add to StoreModel.fromJson
if "json['has_offer']" not in store_model:
    store_model = store_model.replace('tags: tags,', "tags: tags,\n      hasOffer: json['has_offer'] == true,\n      ratingAvg: json['rating_avg'] != null ? (json['rating_avg'] as num).toDouble() : null,\n      ratingCount: json['rating_count'] != null ? (json['rating_count'] as num).toInt() : null,")

with open('lib/features/home/data/models/store_model.dart', 'w') as f:
    f.write(store_model)
