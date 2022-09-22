import 'package:blocproject/cubit/todo_cubit_cubit.dart';
import 'package:blocproject/models/todo.dart';
import 'package:blocproject/views/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    // 1
    // final bloc = BlocProvider.of<ArticleListBloc>(context);
    return BlocProvider(
      create: (context) => TodoCubitSearch(),
      child: BlocBuilder<TodoCubitSearch, List<Todo>>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Articles')),
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search ...',
                      ),
                      // 2
                      onChanged: (value) {
                        context
                            .read<TodoCubitSearch>()
                            .searchTodo(value, search);
                      },
                    )),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state[index].title!),
                        subtitle: Text(state[index].decription!),
                      ),
                    );
                  },
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
