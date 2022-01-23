import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_sample/todo/data/database_repository.dart';
import 'package:block_sample/todo/data/model/TodoResponse.dart';
import 'package:block_sample/todo/data/model/todo.dart';
import 'package:block_sample/todo/data/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Repository repository;
  final DatabaseRepository hiveRepository;
  String token='';

  TodoBloc({required this.repository,required this.hiveRepository}) : super(TodoState()) {
    on<AddTodo>(_addTodo);
    on<CompleteTodo>(_completeTodo);
    on<DeleteTodo>(_deleteTodo);
    on<FetchTodo>(_fetchTodo);
    add(FetchTodo());
    getToken();
  }

  getToken(){
    var user=hiveRepository.getModels();
    token=user[0].token;
  }

  _addTodo(AddTodo todo, Emitter<TodoState> emit){

  }

  _completeTodo(CompleteTodo todo, Emitter<TodoState> emit){

  }

  _deleteTodo(DeleteTodo todo, Emitter<TodoState> emit){

  }

  _fetchTodo(FetchTodo todo, Emitter<TodoState> emit) async {
    emit(TodoState(status: TodosStatus.loading));

    TodoResponse todoResponse = await repository.getTodos(token);
    if (todoResponse.error == '') {
      emit(TodoState(status: TodosStatus.success,todo: todoResponse.todo!.data));
    } else{
      emit(TodoState(status: TodosStatus.failure,message: todoResponse.error));
    }
  }
}
