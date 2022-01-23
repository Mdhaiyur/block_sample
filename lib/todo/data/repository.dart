import 'package:block_sample/todo/data/model/TodoResponse.dart';
import 'package:block_sample/todo/data/model/user.dart';
import 'package:block_sample/todo/data/network_services.dart';

import 'model/user_response.dart';

class Repository{
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<UserResponse> loginUser(String email,String password) async {
    final response = await networkService.loginUser(email,password);
    return response;
  }

  Future<UserResponse> signupUser(String email,String password,String name,int age) async {
    final response = await networkService.signupUser(email,password,name,age);
    return response;
  }

  Future<TodoResponse> getTodos(String token) async {
    final response = await networkService.fetchTodos(token);
    return response;
  }

}