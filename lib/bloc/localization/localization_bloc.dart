import 'package:bloc/bloc.dart';
import 'localization_event.dart';
import 'localization_state.dart';
import 'package:flutter/material.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {

  List<Locale> supportedLocales = const [
    Locale('en', ''),
    Locale('ur', ''),
  ];


  LocalizationBloc() : super(const LocalizationState(Locale('en'))) {
    on<ChangeLocalization>((event, emit) {
      emit(LocalizationState(event.locale));
    });
  }

  bool get isEnglish => state.locale.languageCode == 'en';

  void toggleLocalization() {
    if (isEnglish) {
      add(const ChangeLocalization(Locale('ur')));
    } else {
      add(const ChangeLocalization(Locale('en')));
    }
  }
}
