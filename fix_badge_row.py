import re

with open('lib/core/widgets/shared_store_list_tile.dart', 'r') as f:
    content = f.read()

# We want to replace the children of the discount badge Row:
old_badge_children = """                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'خصومات تصل إلى 20 % ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Expo Arabic',
                                            fontWeight: FontWeight.w500,
                                            height: 1.25,
                                          ),
                                        ),
                                        const SizedBox(width: 2), // gap: 2px
                                        const Text(
                                          '🔥',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),"""

new_badge_children = """                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          '🔥',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          'خصومات تصل إلى 20 % ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Expo Arabic',
                                            fontWeight: FontWeight.w500,
                                            height: 1.25,
                                          ),
                                        ),
                                      ],
                                    ),"""

if old_badge_children in content:
    content = content.replace(old_badge_children, new_badge_children)
else:
    print("Warning: old_badge_children not found. Falling back to regex.")
    # In case spacing differs:
    content = re.sub(
        r"child:\s*Row\(\s*mainAxisSize:\s*MainAxisSize\.min,\s*children:\s*\[\s*const\s*Text\(\s*'خصومات تصل إلى 20 % '.*?\),\s*const\s*SizedBox\(width:\s*2\),.*?const\s*Text\(\s*'🔥'.*?\),\s*\],\s*\),",
        new_badge_children,
        content,
        flags=re.DOTALL
    )

with open('lib/core/widgets/shared_store_list_tile.dart', 'w') as f:
    f.write(content)
