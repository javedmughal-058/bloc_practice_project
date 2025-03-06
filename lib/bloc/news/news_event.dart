// lib/bloc/news_bloc/news_event.dart

import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNews extends NewsEvent {
  final String? query;
  final DateTime? date;
  final String? page;

  FetchNews({this.query, this.date, this.page});

  @override
  List<Object?> get props => [query, date];
}

class FetchMoreNews extends NewsEvent {
  final String? query;
  final DateTime? date;
  final String? page;

  FetchMoreNews({this.query, this.date, this.page});

  @override
  List<Object?> get props => [query, date];
}
