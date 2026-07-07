import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/user/domain/entities/user_profile.dart';
import 'package:food_user_app/features/user/domain/entities/user_settings.dart';

class ProfileState extends Equatable {
  final UserProfile? profile;
  final UserSettings? settings;
  final bool isLoading;
  final String? errorMessage;
  final bool deleteAccountSuccess;
  final bool updateProfileSuccess;
  final bool updateSettingsSuccess;

  const ProfileState({
    this.profile,
    this.settings,
    this.isLoading = false,
    this.errorMessage,
    this.deleteAccountSuccess = false,
    this.updateProfileSuccess = false,
    this.updateSettingsSuccess = false,
  });

  ProfileState copyWith({
    UserProfile? profile,
    UserSettings? settings,
    bool? isLoading,
    String? errorMessage,
    bool? deleteAccountSuccess,
    bool? updateProfileSuccess,
    bool? updateSettingsSuccess,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      settings: settings ?? this.settings,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      deleteAccountSuccess: deleteAccountSuccess ?? this.deleteAccountSuccess,
      updateProfileSuccess: updateProfileSuccess ?? this.updateProfileSuccess,
      updateSettingsSuccess:
          updateSettingsSuccess ?? this.updateSettingsSuccess,
    );
  }

  @override
  List<Object?> get props => [
    profile,
    settings,
    isLoading,
    errorMessage,
    deleteAccountSuccess,
    updateProfileSuccess,
    updateSettingsSuccess,
  ];
}
