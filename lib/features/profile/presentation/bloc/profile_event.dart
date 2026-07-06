import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/user/data/models/update_user_profile_request.dart';
import 'package:food_user_app/features/user/data/models/update_user_settings_request.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends ProfileEvent {
  const GetProfileEvent();
}

class UpdateProfileEvent extends ProfileEvent {
  final UpdateUserProfileRequest request;
  const UpdateProfileEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class GetSettingsEvent extends ProfileEvent {
  const GetSettingsEvent();
}

class UpdateSettingsEvent extends ProfileEvent {
  final UpdateUserSettingsRequest request;
  const UpdateSettingsEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class DeleteAccountEvent extends ProfileEvent {
  const DeleteAccountEvent();
}
