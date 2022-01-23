import 'package:block_sample/todo/data/model/TodoResponse.dart';
import 'package:dio/dio.dart';

import 'model/user_response.dart';

class NetworkService {
  final options = BaseOptions(
      baseUrl: 'https://api-nodejs-todolist.herokuapp.com',
      connectTimeout: 10000,
      receiveTimeout: 10000,
      contentType: Headers.jsonContentType);

  Future<UserResponse> loginUser(String email, String password) async {
    try {
      var requestParams = {
        'email': email,
        'password': password,
      };
      final response = await Dio(options).post('/user/login',data: requestParams);
      return UserResponse.fromJson(response.data);
    } on DioError catch (e){
      return UserResponse.withError(e.response != null?e.response!.data.toString():e.error);
    } catch (e) {
      return UserResponse.withError('Something want wrong.Please try again.');
    }
  }

  Future<UserResponse> signupUser(String email, String password,String name,int age) async {
    try {
      var requestParams = {
        'email': email,
        'password': password,
        'name':name,
        'age':age,
      };
      final response = await Dio(options).post('/user/register',data: requestParams);
      return UserResponse.fromJson(response.data);
    } on DioError catch (e){
      return UserResponse.withError(e.response != null?e.response!.data.toString():e.error);
    } catch (e) {
      return UserResponse.withError('Something want wrong.Please try again.');
    }
  }

  Future<TodoResponse> fetchTodos(String token) async {
    try {
      final response = await Dio(options.copyWith(headers: {'Authorization':token})).get('/task');
      return TodoResponse.fromJson(response.data);
    } on DioError catch (e){
      return TodoResponse.withError(e.response != null?e.response!.data.toString():e.error);
    } catch (e) {
      return TodoResponse.withError('Something want wrong.Please try again.');
    }
  }
}
