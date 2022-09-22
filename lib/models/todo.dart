class Todo {
  int? id;
  String? title;
  String? decription;

  Todo(
    this.id,
    this.title,
    this.decription,
  );

  Todo copyWithTodo({int? id, String? title, String? description}) {
    return Todo(
        id ?? this.id, title ?? this.title, description ?? this.decription);
  }
}
