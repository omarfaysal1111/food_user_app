import 'package:food_user_app/features/auth/domain/entities/user.dart';


class UserModel extends User {
  const UserModel({required super.id, required super.name, required super.email, required super.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // TODO: implement
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    // TODO: implement
    throw UnimplementedError();
  }
}
