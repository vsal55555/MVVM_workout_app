import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_example/models/Todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  //List<Todo> todos = <Todo>[];  //to make this reactive by changing the type
  //1st way late RxList todos;
  //2nd way var todos = List<Todo>().obs; 
  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');

    if(!storedTodos.isNull) {
      todos = storedTodos!.map((e) => Todo.fromJson(e)).toList().obs;
      //or todos = RxList(storedTodos.map((e) => Todo.fromJson(e)).toList());
    }

    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }

}