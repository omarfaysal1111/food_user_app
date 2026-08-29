import re

with open('lib/core/widgets/shared_store_list_tile.dart', 'r') as f:
    content = f.read()

old_emoji = """                                        const Text(
                                          '🔥',
                                          style: TextStyle(fontSize: 10),
                                        ),"""

new_icon = """                                        AppSvgImage.asset(
                                          AppAssets.serviceSaleIcon,
                                          width: 12,
                                          height: 12,
                                        ),"""

content = content.replace(old_emoji, new_icon)

with open('lib/core/widgets/shared_store_list_tile.dart', 'w') as f:
    f.write(content)
