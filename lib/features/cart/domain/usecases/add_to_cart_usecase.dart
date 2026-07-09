import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/cart/domain/entities/cart.dart';
import 'package:food_user_app/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class AddToCartParams extends Equatable {
  final String menuItemId;
  final int quantity;
  final List<Map<String, dynamic>>? selectedModifiers;
  final String? notes;

  const AddToCartParams({
    required this.menuItemId,
    required this.quantity,
    this.selectedModifiers,
    this.notes,
  });

  @override
  List<Object?> get props => [menuItemId, quantity, selectedModifiers, notes];
}

class AddToCartUseCase extends UseCase<Cart, AddToCartParams> {
  final CartRepository repository;

  AddToCartUseCase({required this.repository});

  @override
  Future<Either<Failure, Cart>> call(AddToCartParams params) async {
    return await repository.addToCart(
      menuItemId: params.menuItemId,
      quantity: params.quantity,
      selectedModifiers: params.selectedModifiers,
      notes: params.notes,
    );
  }
}
