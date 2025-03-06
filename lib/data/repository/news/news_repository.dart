import 'dart:developer';

import 'package:bloc_practice_project/data/model/news/news_model.dart';
import 'package:bloc_practice_project/services/api_service.dart';
import 'package:bloc_practice_project/utils/constant.dart';

class NewsRepository with ApiService{

  Future<NewsModel> fetchNews({String? query, DateTime? date, String? page}) async {
    var search = query ?? "weather";
    var queryDate = date ?? DateTime.now().subtract(const Duration(days: 1)).toString().split(' ').first;
    var pageNumber = page ?? "1";
    final response = await getData(apiUrl: '$baseUrl/everything?q=$search&from=$queryDate&page=$pageNumber&pageSize=10&sortBy=publishedAt&apiKey=$newApiToken');
    return NewsModel.fromJson(response.data);
  }



}