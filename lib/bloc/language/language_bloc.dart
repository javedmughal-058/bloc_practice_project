import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final Locale locale;

  ChangeLanguage(this.locale);
}

// States
class LanguageState {
  final Locale locale;

  LanguageState(this.locale);
}

// Bloc
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {

  List<Locale> supportedLocales = const [
    Locale('en', ''),
    Locale('ur', ''),
  ];

  LanguageBloc() : super(LanguageState(const Locale('en'))) {
    on<ChangeLanguage>((event, emit) {
      emit(LanguageState(event.locale));
    });
  }

  bool get isEnglish => state.locale.languageCode == 'en';

  void toggleLanguage() {
    if (isEnglish) {
      add(ChangeLanguage(const Locale('ur')));
    } else {
      add(ChangeLanguage(const Locale('en')));
    }
  }
}