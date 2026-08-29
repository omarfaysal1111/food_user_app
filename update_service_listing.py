import re

with open('lib/features/service_listing/presentation/pages/service_listing_screen.dart', 'r') as f:
    content = f.read()

# Replace mapping logic
old_map = """items: stores.map((s) => ServicePlaceData.store(
                                      id: s.id.toString(),
                                      name: s.name,
                                      time: '${s.prepTimeFrom ?? 0}-${s.prepTimeTo ?? 0} min',
                                      imageAsset: s.cover ?? s.logo ?? '',
                                      rating: '0.0', // Fallback as rating is missing in Store
                                      hasOffer: false,
                                      topRated: false,
                                    )).toList(),"""

new_map = """items: stores.map((s) => ServicePlaceData.store(
                                      id: s.id.toString(),
                                      name: s.name,
                                      time: '${s.prepTimeFrom ?? 0}-${s.prepTimeTo ?? 0}', // we will handle 'min' localization in the tile or here. Wait, let's localize here!
                                      // Actually the prompt says: update the formatting logic (either in the UI _TimeLabel or the mapper). 
                                      // If I do it in mapper: time: '${s.prepTimeFrom ?? 0}-${s.prepTimeTo ?? 0} ${Directionality.of(context) == TextDirection.rtl ? "دقيقة" : "mins"}',
                                      // But wait, the mapper is in the build method.
                                      // We can use l10n.
"""

