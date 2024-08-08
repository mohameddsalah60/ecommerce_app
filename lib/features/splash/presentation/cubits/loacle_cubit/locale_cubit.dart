import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(const Locale('en')));

  void setLocale(String langCode) {
    emit(LocaleState(Locale(langCode)));
  }
}
