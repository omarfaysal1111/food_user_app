import re

with open('lib/core/constants/app_assets.dart', 'r') as f:
    content = f.read()

bad_block = """  static const serviceFavouriteIcon =
  static const serviceSaleIcon =
      'assets/images/service_listing/sale.svg';
      'assets/images/service_listing/icon_favourite.svg';"""

good_block = """  static const serviceFavouriteIcon =
      'assets/images/service_listing/icon_favourite.svg';
  static const serviceSaleIcon =
      'assets/images/service_listing/sale.svg';"""

content = content.replace(bad_block, good_block)

with open('lib/core/constants/app_assets.dart', 'w') as f:
    f.write(content)
