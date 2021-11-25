import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_example/controllers/TodoController.dart';
import 'package:getx_example/screens/TodoScreen.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({ Key? key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed("/todo");
          //Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                var removed = todoController.todos[index];
                todoController.todos.removeAt(index);
                Get.snackbar('Task removed', 'The task "${removed.text}" was successfully removed.',
                icon: Icon(Icons.person), duration: Duration(seconds: 2),
                backgroundColor: Colors.green,
                mainButton: TextButton(onPressed: () {
                  print('undo pressed');
                  if (removed.isNull) {
                    return;
                  }
                  todoController.todos.insert(index, removed);
                  //removed.text = "";
                  if (Get.isSnackbarOpen!) {
                    Get.back();
                  }
                },
                child: Text('Undo', style: TextStyle(color: Colors.black))),
                onTap: (_) {
                    print('ok');
                } 
                );
              },
              child: ListTile(
                title: Text(
                  todoController.todos[index].text,
                  style: (todoController.todos[index].done)
                  ? TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough
                  )
                  : TextStyle(
                    color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.color)),
                    onTap: () {
                      print('pressed me');
                      Get.to(TodoScreen(index: index));
                    },
                    leading: Checkbox(
                      value: todoController.todos[index].done,
                      onChanged: (v) {
                        var changed = todoController.todos[index];
                        changed.done = v!;
                        todoController.todos[index] = changed;
                      },
                    ),
                    trailing: Icon(Icons.chevron_right),
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: todoController.todos.length)
        ),
      ),
    );
  }
}