import 'package:block_sample/todo/data/model/user.dart';

class UserResponse {
  final User? user;
  final String? error;

  UserResponse(this.user, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json),
        error = "";

  UserResponse.withError(String errorValue)
      : user = null,
        error = errorValue;
}
