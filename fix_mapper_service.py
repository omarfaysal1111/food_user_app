import re

with open('lib/features/service_listing/presentation/pages/service_listing_screen.dart', 'r') as f:
    content = f.read()

# The block to replace:
#                                   _ServicePlaceCollection(
#                                     items: stores.map((s) => ServicePlaceData.store(
#                                       id: s.id.toString(),
#                                       name: s.name,
#                                       time: '${s.prepTimeFrom ?? 0}-${s.prepTimeTo ?? 0} min',
#                                       imageAsset: s.cover ?? s.logo ?? '',
#                                       rating: '0.0', // Fallback as rating is missing in Store
#                                       hasOffer: false,
#                                       topRated: false,
#                                     )).toList(),
#                                   ),

old_block = r"time:\s*'\$\{s\.prepTimeFrom \?\? 0\}-\$\{s\.prepTimeTo \?\? 0\} min',\s*imageAsset:\s*s\.cover \?\? s\.logo \?\? '',\s*rating:\s*'0\.0',\s*// Fallback.*?\s*hasOffer:\s*false,"

new_block = """time: '${s.prepTimeFrom ?? 0}-${s.prepTimeTo ?? 0}',
                                      imageAsset: s.cover ?? s.logo ?? '',
                                      rating: s.ratingAvg?.toStringAsFixed(1) ?? '0.0',
                                      hasOffer: s.hasOffer,"""

content = re.sub(old_block, new_block, content)

with open('lib/features/service_listing/presentation/pages/service_listing_screen.dart', 'w') as f:
    f.write(content)
