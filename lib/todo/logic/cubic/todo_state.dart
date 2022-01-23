part of 'todo_bloc.dart';


enum TodosStatus { initial, loading, success, failure }

class TodoState extends Equatable{
  List<Todo>? todo;
  TodosStatus? status;
  String? message;

  TodoState({this.todo, this.status,this.message});

  @override
  List<Object?> get props =>[todo,status,message];

  TodoState copyWith({
    List<Todo>? todo,
    TodosStatus? status,
    String? message,
  }) {
    return TodoState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

