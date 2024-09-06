import 'package:bloc_practice_project/bloc/todo_example/todo_bloc.dart';
import 'package:bloc_practice_project/bloc/todo_example/todo_event.dart';
import 'package:bloc_practice_project/bloc/todo_example/todo_state.dart';
import 'package:bloc_practice_project/main.dart';
import 'package:bloc_practice_project/ui/slider_page.dart';
import 'package:bloc_practice_project/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Todo Page'),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return state.isLoading
              ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))
              : state.todoList.isEmpty
              ? const Center(child: Text('No Item Added'))
              : ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todoList[index]));
                      },
                      icon: Icon(Icons.delete_outline, color: Colors.red.shade500)),
                  );
                },
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'btn',
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: "Task: $i"));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
