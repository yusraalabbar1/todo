import 'package:bloc/bloc.dart';
import 'package:blocproject/models/app_setting.dart';
import 'package:flutter/cupertino.dart';

class AppSettingCubit extends Cubit<AppSettings> {
  AppSettingCubit() : super(const AppSettings(false, Brightness.light));

  void changMaterial3Usage(bool useMaterial3) {
    emit(state.copyWith(useMaterial3: useMaterial3));
  }

  void changeBrightness(Brightness themebrightness) {
    emit(state.copyWith(themeBrightness: themebrightness));
  }
}
