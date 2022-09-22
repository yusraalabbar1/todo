import 'package:blocproject/cubit/app_settig_cubit.dart';
import 'package:blocproject/views/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AppSettingCubit(),
    child: const App(),
  ));
}
