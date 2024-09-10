import 'package:bloc/bloc.dart';
import 'package:bloc_practice_project/bloc/todo_example/todo_event.dart';
import 'package:bloc_practice_project/bloc/todo_example/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{

  final List<String> todoList = [];

  TodoBloc() :super(const TodoState()){
    on<AddTodoEvent>(_addTodoItems);
    on<RemoveTodoEvent>(_removeTodoItem);
  }


  Future<void> _addTodoItems(AddTodoEvent event, Emitter<TodoState> emit) async {
    todoList.clear();
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList), isLoading: false));
  }

  void _removeTodoItem(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList), isLoading: false));
  }


}