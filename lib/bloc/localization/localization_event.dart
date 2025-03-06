import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Events
abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object?> get props => [];
}

class ChangeLocalization extends LocalizationEvent {
  final Locale locale;

  const ChangeLocalization(this.locale);

  @override
  List<Object?> get props => [locale];
}
