import 'package:flutter/widgets.dart';

import 'package:food_user_app/features/profile/presentation/controllers/saved_addresses_controller.dart';

class SavedAddressesScope extends InheritedNotifier<SavedAddressesController> {
  const SavedAddressesScope({
    super.key,
    required super.notifier,
    required super.child,
  });

  static SavedAddressesController of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<SavedAddressesScope>();
    assert(
      scope?.notifier != null,
      'SavedAddressesScope missing above this context',
    );
    return scope!.notifier!;
  }
}
