import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryCubit({required this.getCategoriesUseCase})
      : super(const CategoryState.initial());

  Future<void> fetchCategories() async {
    emit(const CategoryState.loading());
    final result = await getCategoriesUseCase(NoParams());
    result.fold(
      (failure) => emit(CategoryState.error(failure.message)),
      (categories) => emit(CategoryState.loaded(categories)),
    );
  }
}
