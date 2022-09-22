import 'package:blocproject/cubit/app_settig_cubit.dart';
import 'package:blocproject/models/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({super.key});

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Use Material"),
              BlocBuilder<AppSettingCubit, AppSettings>(
                builder: (context, state) {
                  return Switch(
                      value: state.useMaterial3,
                      onChanged: (value) {
                        context
                            .read<AppSettingCubit>()
                            .changMaterial3Usage(value);
                      });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dark theme"),
              BlocBuilder<AppSettingCubit, AppSettings>(
                builder: (context, state) {
                  return Switch(
                      value: state.themeBrightness == Brightness.dark
                          ? true
                          : false,
                      onChanged: (value) {
                        context.read<AppSettingCubit>().changeBrightness(
                            value ? Brightness.dark : Brightness.light);
                      });
                },
              )
            ],
          )
        ]),
      ),
    );
  }
}
