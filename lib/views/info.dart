import 'package:blocproject/cubit/todo_cubit_cubit.dart';
import 'package:blocproject/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class info extends StatefulWidget {
  final id;
  const info({super.key,this.id});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => TodoCubitCubit(),
        child: BlocBuilder<TodoCubitCubit, List<Todo>>(
          builder: (context, state) {
            return Column(
              children: [
                Text(""),
              ],
            );
          },
        ),
      ),
    );
  }
}
