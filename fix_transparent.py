import re

with open('lib/core/widgets/shared_store_list_tile.dart', 'r') as f:
    content = f.read()

# Replace surfaceCard with transparent
content = re.sub(
    r'color:\s*AppColors\.surfaceCard\(context\),\s*//?\s*rgba?.*?\n',
    'color: Colors.transparent,\n',
    content
)
content = re.sub(
    r'color:\s*AppColors\.surfaceCard\(context\),',
    'color: Colors.transparent,',
    content,
    count=1 # only the first one which is the container decoration, wait, there is another one for the favorite icon background
)

with open('lib/core/widgets/shared_store_list_tile.dart', 'w') as f:
    f.write(content)
