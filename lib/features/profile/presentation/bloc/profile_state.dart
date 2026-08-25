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

  // Phone Change fields
  final String? phoneChangeToken;
  final bool sendCurrentOtpSuccess;
  final bool verifyCurrentOtpSuccess;
  final bool sendNewOtpSuccess;
  final bool changePhoneSuccess;

  const ProfileState({
    this.profile,
    this.settings,
    this.isLoading = false,
    this.errorMessage,
    this.deleteAccountSuccess = false,
    this.updateProfileSuccess = false,
    this.updateSettingsSuccess = false,
    this.phoneChangeToken,
    this.sendCurrentOtpSuccess = false,
    this.verifyCurrentOtpSuccess = false,
    this.sendNewOtpSuccess = false,
    this.changePhoneSuccess = false,
  });

  ProfileState copyWith({
    UserProfile? profile,
    UserSettings? settings,
    bool? isLoading,
    String? errorMessage,
    bool? deleteAccountSuccess,
    bool? updateProfileSuccess,
    bool? updateSettingsSuccess,
    String? phoneChangeToken,
    bool? sendCurrentOtpSuccess,
    bool? verifyCurrentOtpSuccess,
    bool? sendNewOtpSuccess,
    bool? changePhoneSuccess,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      settings: settings ?? this.settings,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      deleteAccountSuccess: deleteAccountSuccess ?? false,
      updateProfileSuccess: updateProfileSuccess ?? false,
      updateSettingsSuccess: updateSettingsSuccess ?? false,
      phoneChangeToken: phoneChangeToken ?? this.phoneChangeToken,
      sendCurrentOtpSuccess: sendCurrentOtpSuccess ?? false,
      verifyCurrentOtpSuccess: verifyCurrentOtpSuccess ?? false,
      sendNewOtpSuccess: sendNewOtpSuccess ?? false,
      changePhoneSuccess: changePhoneSuccess ?? false,
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
    phoneChangeToken,
    sendCurrentOtpSuccess,
    verifyCurrentOtpSuccess,
    sendNewOtpSuccess,
    changePhoneSuccess,
  ];
}
