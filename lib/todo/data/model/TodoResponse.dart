import 'package:block_sample/todo/data/model/todo.dart';

class TodoResponse {
  final TodoModel? todo;
  final String? error;

  TodoResponse(this.todo, this.error);

  TodoResponse.fromJson(Map<String, dynamic> json)
      : todo = TodoModel.fromJson(json),
        error = "";

  TodoResponse.withError(String errorValue)
      : todo = null,
        error = errorValue;
}
