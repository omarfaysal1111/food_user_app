import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';

class MenuCategory extends Equatable {
  final String id;
  final String branchId;
  final String name;
  final int sortOrder;
  final List<MenuItem> items;
  final bool visible;

  const MenuCategory({
    required this.id,
    required this.branchId,
    required this.name,
    required this.sortOrder,
    required this.items,
    required this.visible,
  });

  @override
  List<Object?> get props => [id, branchId, name, sortOrder, items, visible];
}
