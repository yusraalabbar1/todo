import 'package:blocproject/cubit/app_settig_cubit.dart';
import 'package:blocproject/cubit/todo_cubit_cubit.dart';
import 'package:blocproject/models/app_setting.dart';
import 'package:blocproject/views/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingCubit, AppSettings>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Todo App',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: state.useMaterial3,
              brightness: state.themeBrightness),
          home: BlocProvider(
            create: (_) => TodoCubitCubit(),
            child: const MyHomePage(title: 'Todo App'),
          ),
        );
      },
    );
  }
}
