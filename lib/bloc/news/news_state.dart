import 'package:bloc_practice_project/data/model/news/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsModel news;
  final bool isLoadingMore; // Flag for when more items are loading

  NewsLoaded({required this.news, this.isLoadingMore = false});

  // CopyWith method to update the state
  NewsLoaded copyWith({NewsModel? news, bool? isLoadingMore}) {
    return NewsLoaded(
      news: news ?? this.news,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});
}
