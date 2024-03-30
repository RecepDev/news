import 'package:dio/dio.dart';
import 'package:news/core/api/api_secret.dart';

import 'package:news/core/models/article.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Article>> getNews() async {
    const String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=bcae7f5abb0c45b985bed152d1e445d2';
    final response = await dio.get(url);
    final articlesJson = response.data['articles'] as List;
    final articles = articlesJson
        .map(
          (e) => Article.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return articles;
  }

  Future<List<Article>> changeCategory(String category) async {
     String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=bcae7f5abb0c45b985bed152d1e445d2';
    final response = await dio.get(url);
    final articlesJson = response.data['articles'] as List;
    final articles = articlesJson
        .map(
          (e) => Article.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return articles;
  }
  Future<List<Article>> search(String searchKey) async {
     String url =
        'https://newsapi.org/v2/everything?q=$searchKey&apiKey=bcae7f5abb0c45b985bed152d1e445d2';
    final response = await dio.get(url);
    final articlesJson = response.data['articles'] as List;
    final articles = articlesJson
        .map(
          (e) => Article.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return articles;
  }
}
