import 'package:bloc/bloc.dart';
import 'package:blocproject/models/todo.dart';

class TodoCubitCubit extends Cubit<List<Todo>> {
  TodoCubitCubit()
      : super([
          Todo(0, "s", "decription 0"),
          Todo(1, "title 1", "decription 1"),
          Todo(2, "title 2", "decription 2"),
          Todo(3, "title 3", "decription 3")
        ]);

  void addTodo(Todo todo) {
    emit([...state, todo]);
  }

  void deletTodo(int id) {
    emit(state.where((element) => element.id != id).toList());
  }

  void editTodo(int id, Todo todo) {
    if (state[todo.id!].id == id) {
      state[todo.id!].decription = todo.decription;
      state[todo.id!].id = todo.id;
      state[todo.id!].title = todo.title;
      emit([...state]);
    } else {
      print("noooooooooo");
    }
  }
}

class TodoCubitSearch extends Cubit<List<Todo>> {
  TodoCubitSearch() : super([]);

  void searchTodo(t, s) {
    print("=============1==============");

    emit([
      ...s.where((element) => element.title.toString().startsWith(t)).toList()
    ]);
  }
}

class TodoCubitGet extends Cubit<Todo> {
  TodoCubitGet(super.initialState);
  // TodoCubitSearch() : super(Todo(0, "s", "decription 0"));

  getElement(int id) {
    print(id);
  }
}
