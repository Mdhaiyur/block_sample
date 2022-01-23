import 'package:block_sample/todo/data/model/todo.dart';
import 'package:block_sample/todo/logic/cubic/todo_bloc.dart';
import 'package:block_sample/todo/logic/cubic/todo_bloc.dart';
import 'package:block_sample/todo/logic/cubic/todo_bloc.dart';
import 'package:block_sample/todo/logic/cubic/todo_bloc.dart';
import 'package:block_sample/todo/logic/cubic/todo_bloc.dart';
import 'package:block_sample/todo/presentation/screen/add_todo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Todo',
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AddTodoScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
            )
          ],
        ),
        body: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state.status == TodosStatus.failure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message!)));
            }
          },
          builder: (context, state) {
            if (state.status == TodosStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == TodosStatus.success) {
              if (state.todo!.isEmpty) {
                return const Center(child: const Text("No data"));
              }
              return ListView.separated(
                itemCount: state.todo!.length,
                itemBuilder: (context, index) {
                  Todo todo = state.todo![index];

                  return Card(
                      elevation: 2,
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            todo.description!,
                            style: GoogleFonts.poppins(fontSize: 14),
                          )));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              );
            }

            if (state.status == TodosStatus.failure) {
              return Center(
                child: Text(state.message!),
              );
            }
            return Text('');
          },
        ));
  }
}
