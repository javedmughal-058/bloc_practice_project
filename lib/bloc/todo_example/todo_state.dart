import 'package:equatable/equatable.dart';

class TodoState extends Equatable{

  final List<String> todoList;
  final bool isLoading;
  const TodoState({this.todoList = const [], this.isLoading = false});


  TodoState copyWith({List<String>? todoList, bool? isLoading}){
    return TodoState(
        isLoading: isLoading ?? this.isLoading,
        todoList: todoList ?? this.todoList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todoList, isLoading];

}