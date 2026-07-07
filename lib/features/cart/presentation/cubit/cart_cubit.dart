import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/cart/domain/entities/cart.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/features/cart/domain/repositories/cart_repository.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;

  CartCubit({required this.cartRepository}) : super(const CartState.initial());

  Future<void> loadCart() async {
    emit(const CartState.loading());
    final result = await cartRepository.getCart();
    result.fold(
      (failure) => emit(CartState.error(
        cart: const Cart.empty(),
        message: failure.message,
      )),
      (cart) => emit(CartState.loaded(cart: cart)),
    );
  }

  Future<void> addToCart({
    required String menuItemId,
    required String name,
    required int price,
    required int quantity,
    List<Map<String, dynamic>>? selectedModifiers,
    String? notes,
  }) async {
    final currentCart = state.maybeWhen(
      loaded: (cart, promo) => cart,
      error: (cart, promo, message) => cart,
      orElse: () => const Cart.empty(),
    );
    final currentPromo = state.maybeWhen(
      loaded: (cart, promo) => promo,
      error: (cart, promo, message) => promo,
      orElse: () => null,
    );

    final List<CartItem> updatedItems = List.from(currentCart.items);
    final existingIndex = updatedItems.indexWhere((item) => item.menuItemId == menuItemId);

    if (existingIndex != -1) {
      final existing = updatedItems[existingIndex];
      updatedItems[existingIndex] = existing.copyWith(
        quantity: existing.quantity + quantity,
        totalPrice: (existing.quantity + quantity) * existing.unitPrice,
      );
    } else {
      updatedItems.add(CartItem(
        id: menuItemId,
        menuItemId: menuItemId,
        name: name,
        price: price,
        unitPrice: price.toDouble(),
        totalPrice: (price * quantity).toDouble(),
        quantity: quantity,
        selectedModifiers: selectedModifiers,
        notes: notes,
      ));
    }

    final newSubtotal = updatedItems.fold<double>(0, (sum, item) => sum + item.totalPrice);
    final newDiscount = currentPromo != null ? currentPromo.discountAmount : currentCart.discount;
    final newTotal = newSubtotal + currentCart.deliveryFee - newDiscount;

    final optimisticCart = Cart(
      id: currentCart.id,
      restaurantId: currentCart.restaurantId,
      restaurantName: currentCart.restaurantName,
      items: updatedItems,
      subtotal: newSubtotal,
      deliveryFee: currentCart.deliveryFee,
      discount: newDiscount,
      total: newTotal,
    );

    emit(CartState.loaded(cart: optimisticCart, appliedPromo: currentPromo));

    final result = await cartRepository.addToCart(
      menuItemId: menuItemId,
      quantity: quantity,
      selectedModifiers: selectedModifiers,
      notes: notes,
    );

    result.fold(
      (failure) => emit(CartState.error(
        cart: currentCart,
        appliedPromo: currentPromo,
        message: failure.message,
      )),
      (serverCart) => emit(CartState.loaded(cart: serverCart, appliedPromo: currentPromo)),
    );
  }

  Future<void> updateItemQuantity(String itemId, int newQuantity) async {
    final currentCart = state.maybeWhen(
      loaded: (cart, promo) => cart,
      error: (cart, promo, message) => cart,
      orElse: () => const Cart.empty(),
    );
    final currentPromo = state.maybeWhen(
      loaded: (cart, promo) => promo,
      error: (cart, promo, message) => promo,
      orElse: () => null,
    );

    if (currentCart.id.isEmpty) return;

    final List<CartItem> updatedItems = List.from(currentCart.items);
    final targetIndex = updatedItems.indexWhere((item) => item.id == itemId);

    if (targetIndex == -1) return;

    final oldItem = updatedItems[targetIndex];
    if (newQuantity <= 0) {
      updatedItems.removeAt(targetIndex);
    } else {
      updatedItems[targetIndex] = oldItem.copyWith(
        quantity: newQuantity,
        totalPrice: newQuantity * oldItem.unitPrice,
      );
    }

    final newSubtotal = updatedItems.fold<double>(0, (sum, item) => sum + item.totalPrice);
    final newDiscount = currentPromo != null ? currentPromo.discountAmount : currentCart.discount;
    final newTotal = newSubtotal + currentCart.deliveryFee - newDiscount;

    final optimisticCart = Cart(
      id: currentCart.id,
      restaurantId: currentCart.restaurantId,
      restaurantName: currentCart.restaurantName,
      items: updatedItems,
      subtotal: newSubtotal,
      deliveryFee: currentCart.deliveryFee,
      discount: newDiscount,
      total: newTotal,
    );

    emit(CartState.loaded(cart: optimisticCart, appliedPromo: currentPromo));

    final result = newQuantity <= 0
        ? await cartRepository.removeFromCart(itemId)
        : await cartRepository.updateCartItem(itemId: itemId, quantity: newQuantity);

    result.fold(
      (failure) => emit(CartState.error(
        cart: currentCart,
        appliedPromo: currentPromo,
        message: failure.message,
      )),
      (serverCart) => emit(CartState.loaded(cart: serverCart, appliedPromo: currentPromo)),
    );
  }

  Future<void> removeItem(String itemId) async {
    await updateItemQuantity(itemId, 0);
  }

  Future<void> clearCart() async {
    final currentCart = state.maybeWhen(
      loaded: (cart, promo) => cart,
      error: (cart, promo, message) => cart,
      orElse: () => const Cart.empty(),
    );
    final currentPromo = state.maybeWhen(
      loaded: (cart, promo) => promo,
      error: (cart, promo, message) => promo,
      orElse: () => null,
    );

    emit(const CartState.loaded(cart: Cart.empty(), appliedPromo: null));

    final result = await cartRepository.clearCart();
    result.fold(
      (failure) => emit(CartState.error(
        cart: currentCart,
        appliedPromo: currentPromo,
        message: failure.message,
      )),
      (_) => emit(const CartState.loaded(cart: Cart.empty(), appliedPromo: null)),
    );
  }

  Future<void> applyPromoCode(String code) async {
    final currentCart = state.maybeWhen(
      loaded: (cart, promo) => cart,
      error: (cart, promo, message) => cart,
      orElse: () => const Cart.empty(),
    );
    final currentPromo = state.maybeWhen(
      loaded: (cart, promo) => promo,
      error: (cart, promo, message) => promo,
      orElse: () => null,
    );

    if (currentCart.id.isEmpty) return;

    emit(const CartState.loading());

    final result = await cartRepository.applyPromo(
      code: code,
      subtotal: currentCart.subtotal,
    );

    result.fold(
      (failure) => emit(CartState.error(
        cart: currentCart,
        appliedPromo: currentPromo,
        message: failure.message,
      )),
      (promo) {
        final updatedCart = Cart(
          id: currentCart.id,
          restaurantId: currentCart.restaurantId,
          restaurantName: currentCart.restaurantName,
          items: currentCart.items,
          subtotal: currentCart.subtotal,
          deliveryFee: currentCart.deliveryFee,
          discount: promo.discountAmount,
          total: promo.total,
        );
        emit(CartState.loaded(cart: updatedCart, appliedPromo: promo));
      },
    );
  }
}
