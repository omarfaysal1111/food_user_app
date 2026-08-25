import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/cart/domain/entities/cart.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:food_user_app/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:food_user_app/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:food_user_app/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:food_user_app/features/cart/domain/usecases/update_cart_item_usecase.dart';
import 'package:food_user_app/features/checkout/domain/usecases/apply_promo_usecase.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final ClearCartUseCase clearCartUseCase;
  final ApplyPromoUseCase applyPromoUseCase;

  CartCubit({
    required this.getCartUseCase,
    required this.addToCartUseCase,
    required this.updateCartItemUseCase,
    required this.removeFromCartUseCase,
    required this.clearCartUseCase,
    required this.applyPromoUseCase,
  }) : super(const CartState.initial());

  Future<void> loadCart() async {
    emit(const CartState.loading());
    final result = await getCartUseCase(NoParams());
    if (isClosed) return;
    result.fold(
      (failure) => emit(CartState.error(
        cart: const Cart.empty(),
        message: failure.message,
      )),
      (cart) => emit(CartState.loaded(cart: cart)),
    );
  }

  Future<void> addToCart({
    required String restaurantId,
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

    if (currentCart.items.isNotEmpty && currentCart.restaurantId != restaurantId) {
      emit(CartState.conflict(
        cart: currentCart,
        newRestaurantId: restaurantId,
        menuItemId: menuItemId,
        name: name,
        price: price,
        quantity: quantity,
        selectedModifiers: selectedModifiers,
        notes: notes,
      ));
      return;
    }

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
        restaurantId: restaurantId,
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
      restaurantId: restaurantId,
      restaurantName: currentCart.restaurantName,
      items: updatedItems,
      subtotal: newSubtotal,
      deliveryFee: currentCart.deliveryFee,
      discount: newDiscount,
      total: newTotal,
    );

    emit(CartState.loaded(cart: optimisticCart, appliedPromo: currentPromo));

    final result = await addToCartUseCase(
      AddToCartParams(
        menuItemId: menuItemId,
        quantity: quantity,
        selectedModifiers: selectedModifiers,
        notes: notes,
      ),
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(CartState.error(
        cart: currentCart,
        appliedPromo: currentPromo,
        message: failure.message,
      )),
      (serverCart) => emit(CartState.loaded(cart: serverCart, appliedPromo: currentPromo)),
    );
  }

  Future<void> clearAndAddToCart({
    required String restaurantId,
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
      conflict: (cart, rId, mId, n, p, q, mods, nts) => cart,
      orElse: () => const Cart.empty(),
    );
    final currentPromo = state.maybeWhen(
      loaded: (cart, promo) => promo,
      error: (cart, promo, message) => promo,
      orElse: () => null,
    );

    emit(const CartState.loading());
    final clearResult = await clearCartUseCase(NoParams());
    if (isClosed) return;
    
    await clearResult.fold(
      (failure) async {
        if (isClosed) return;
        emit(CartState.error(
          cart: currentCart,
          appliedPromo: currentPromo,
          message: failure.message,
        ));
      },
      (_) async {
        if (isClosed) return;
        emit(const CartState.loaded(cart: Cart.empty(), appliedPromo: null));
        await addToCart(
          restaurantId: restaurantId,
          menuItemId: menuItemId,
          name: name,
          price: price,
          quantity: quantity,
          selectedModifiers: selectedModifiers,
          notes: notes,
        );
      },
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
        ? await removeFromCartUseCase(itemId)
        : await updateCartItemUseCase(UpdateCartItemParams(itemId: itemId, quantity: newQuantity));

    if (isClosed) return;

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

    final result = await clearCartUseCase(NoParams());
    if (isClosed) return;
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

    final result = await applyPromoUseCase(
      ApplyPromoParams(
        code: code,
        subtotal: currentCart.subtotal,
      ),
    );

    if (isClosed) return;

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
