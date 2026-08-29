import re

with open('lib/core/widgets/shared_store_list_tile.dart', 'r') as f:
    content = f.read()

# 1. Remove boxShadow
content = re.sub(
    r'boxShadow:\s*\[.*?\]\s*,',
    '',
    content,
    flags=re.DOTALL
)

# 2. Fix Arrow Size
# Currently it looks something like:
# Center(
#   child: SizedBox(
#     width: 20,
#     height: 20,
#     child: Transform.scale(
#       scaleX: isRtl ? -1 : 1,
#       child: AppSvgImage.asset(
#         AppAssets.serviceBackIcon,
#         width: 7, 
#         height: 12,
#         color: AppColors.onSurface(context),
#       ),
#     ),
#   ),
# ),
#
# Wait, let's just replace the exact block.
old_arrow_block = """                  Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Transform.scale(
                        scaleX: isRtl ? -1 : 1,
                        child: AppSvgImage.asset(
                          AppAssets.serviceBackIcon,
                          width: 20, 
                          height: 20,
                          color: AppColors.onSurface(context),
                        ),
                      ),
                    ),
                  ),"""

new_arrow_block = """                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Transform.scale(
                        scaleX: isRtl ? -1 : 1,
                        child: AppSvgImage.asset(
                          AppAssets.serviceBackIcon,
                          width: 12,
                          height: 12,
                          color: AppColors.onSurface(context),
                        ),
                      ),
                    ),
                  ),"""

# In case width was 7 and height 12, let's use regex to be safe.
content = re.sub(
    r'Center\(\s*child:\s*SizedBox\(\s*width:\s*20,\s*height:\s*20,\s*child:\s*Transform\.scale\([\s\S]*?AppSvgImage\.asset\([\s\S]*?color:\s*AppColors\.onSurface\(context\),\s*\),\s*\),\s*\),\s*\),',
    new_arrow_block,
    content
)

with open('lib/core/widgets/shared_store_list_tile.dart', 'w') as f:
    f.write(content)
