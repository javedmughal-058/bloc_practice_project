import 'package:bloc/bloc.dart';
import 'package:bloc_practice_project/data/repository/news/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository = NewsRepository();

  int currentPage = 1;
  bool isLoadingMore = false;

  NewsBloc() : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
    on<FetchMoreNews>(_onFetchMoreNews);
  }

  Future<void> _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());

    try {
      currentPage = 1; // Reset page for fresh load
      final news = await newsRepository.fetchNews(query: event.query, date: event.date, page: currentPage.toString());
      emit(NewsLoaded(news: news));
    } catch (error) {
      emit(NewsError(message: "Failed to load news: $error"));
    }
  }

  Future<void> _onFetchMoreNews(FetchMoreNews event, Emitter<NewsState> emit) async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    try {
      currentPage += 1;
      final moreNews = await newsRepository.fetchNews(query: event.query, date: event.date, page: currentPage.toString());

      if (state is NewsLoaded) {
        final currentNews = (state as NewsLoaded).news;
        final updatedArticles = currentNews.articles! + moreNews.articles!;
        final updatedNews = currentNews.copyWith(articles: updatedArticles);
        emit(NewsLoaded(news: updatedNews));
      }
    } catch (e) {
      emit(NewsError(message: "Failed to load more news"));
    } finally {
      isLoadingMore = false;
    }
  }


}
