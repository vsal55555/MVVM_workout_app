
class Todo {
      String text; //content
      bool done;  //status of done and undone
    Todo({required this.text, this.done = false});

    factory Todo.fromJson(Map<String, dynamic> json) =>
        Todo(text: json['text'], done: json['done']);

    Map<String, dynamic> toJson() => {'text': text, 'done': done};
}