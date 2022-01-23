part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable{}

class FetchTodo extends TodoEvent{
  FetchTodo();
  @override
  List<Object?> get props => [];

}

class AddTodo extends TodoEvent {
  String todo;

  AddTodo({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class CompleteTodo extends TodoEvent
{
  int todoId;

  CompleteTodo({required this.todoId});

  @override
  List<Object?> get props => [todoId];
}

class DeleteTodo extends TodoEvent{
  int todoId;

  DeleteTodo({required this.todoId});

  @override
  List<Object?> get props => [todoId];
}
