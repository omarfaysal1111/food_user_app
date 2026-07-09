import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:food_user_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:food_user_app/features/profile/domain/usecases/get_settings_usecase.dart';
import 'package:food_user_app/features/profile/domain/usecases/update_settings_usecase.dart';
import 'package:food_user_app/features/profile/domain/usecases/delete_account_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetSettingsUseCase getSettingsUseCase;
  final UpdateSettingsUseCase updateSettingsUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  ProfileBloc({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
    required this.getSettingsUseCase,
    required this.updateSettingsUseCase,
    required this.deleteAccountUseCase,
  }) : super(const ProfileState()) {
    on<GetProfileEvent>(_onGetProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<GetSettingsEvent>(_onGetSettings);
    on<UpdateSettingsEvent>(_onUpdateSettings);
    on<DeleteAccountEvent>(_onDeleteAccount);
  }

  Future<void> _onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await getProfileUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (profile) => emit(state.copyWith(isLoading: false, profile: profile)),
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await updateProfileUseCase(event.request);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (profile) => emit(
        state.copyWith(
          isLoading: false,
          profile: profile,
          updateProfileSuccess: true,
        ),
      ),
    );
  }

  Future<void> _onGetSettings(
    GetSettingsEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await getSettingsUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (settings) => emit(state.copyWith(isLoading: false, settings: settings)),
    );
  }

  Future<void> _onUpdateSettings(
    UpdateSettingsEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await updateSettingsUseCase(event.request);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (settings) => emit(
        state.copyWith(
          isLoading: false,
          settings: settings,
          updateSettingsSuccess: true,
        ),
      ),
    );
  }

  Future<void> _onDeleteAccount(
    DeleteAccountEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await deleteAccountUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (_) => emit(state.copyWith(isLoading: false, deleteAccountSuccess: true)),
    );
  }
}
