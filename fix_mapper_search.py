import re

with open('lib/features/home/presentation/pages/search_screen.dart', 'r') as f:
    content = f.read()

content = content.replace("time: '${restaurant.deliveryTimeMin}-${restaurant.deliveryTimeMax} min',", "time: '${restaurant.deliveryTimeMin}-${restaurant.deliveryTimeMax}',")

with open('lib/features/home/presentation/pages/search_screen.dart', 'w') as f:
    f.write(content)
