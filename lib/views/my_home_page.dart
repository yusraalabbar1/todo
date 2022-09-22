import 'package:blocproject/cubit/todo_cubit_cubit.dart';
import 'package:blocproject/models/todo.dart';
import 'package:blocproject/views/app_setting_pae.dart';
import 'package:blocproject/views/info.dart';
import 'package:blocproject/views/page_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<Todo> search = [];

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  String title = "", desc = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AppSetting()));
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const searchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<TodoCubitCubit, List<Todo>>(
          listener: (context, state) {
            if (state.length == 5) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Todos alert'),
                      content: const Text('Todos count==5'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Ok'))
                      ],
                    );
                  });
            }
          },
          builder: (context, state) {
            search = state;
            return ListView.separated(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    context.read<TodoCubitCubit>().deletTodo(state[index].id!);
                  },
                  child: Card(
                    child: ListTile(
                      leading: Column(
                        children: [
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (con) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Enter new title and Description:'),
                                          content: Container(
                                            height: 200,
                                            child: Form(
                                                key: formstate,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      onSaved: (string) {
                                                        title = string!;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      onSaved: (string) {
                                                        desc = string!;
                                                      },
                                                    )
                                                  ],
                                                )),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                var formdata =
                                                    formstate.currentState;
                                                if (formdata!.validate()) {
                                                  formdata.save();
                                                  context
                                                      .read<TodoCubitCubit>()
                                                      .editTodo(
                                                          index,
                                                          Todo(index, title,
                                                              desc));
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text('OK'),
                                            )
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(Icons.edit)),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (_) =>  info(id:state[index].id)));}, icon: const Icon(Icons.info)),
                          )
                        ],
                      ),
                      title: Text(state[index].title!),
                      subtitle: Text(state[index].decription!),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read<TodoCubitCubit>()
            .addTodo(Todo(4, "title add", "decription add")),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
