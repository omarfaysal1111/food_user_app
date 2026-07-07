import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/payment/domain/usecases/checkout_usecase.dart';
import 'package:food_user_app/features/payment/presentation/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutUseCase checkoutUseCase;

  CheckoutCubit({required this.checkoutUseCase}) : super(const CheckoutState.initial());

  Future<void> checkout(CheckoutParams params) async {
    emit(const CheckoutState.loading());
    final result = await checkoutUseCase(params);
    result.fold(
      (failure) => emit(CheckoutState.error(failure.message)),
      (checkoutResult) => emit(CheckoutState.success(checkoutResult)),
    );
  }
}
