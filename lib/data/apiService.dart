import 'package:cursoflutter/model/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  String urlForApi(optionUrl) {
    switch (optionUrl) {
      case 1: //  About Apple
        // apiKey propia: 354359aabd984a3c857b9cbeceb404a5
        // apiKey anterior: 64c32a49e1df4baa8f23a70a562e3c0c
        return 'https://newsapi.org/v2/everything?q=apple&from=2021-02-21&to=2021-02-21&sortBy=popularity&apiKey=354359aabd984a3c857b9cbeceb404a5';
      case 2: //  About Tesla
        return 'https://newsapi.org/v2/everything?q=tesla&from=2021-02-23&sortBy=publishedAt&apiKey=354359aabd984a3c857b9cbeceb404a5';
      case 3: //  US RightNow
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=354359aabd984a3c857b9cbeceb404a5';
      case 4: //  TechCrunch
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=354359aabd984a3c857b9cbeceb404a5';
      case 5: //  WallStreet
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=354359aabd984a3c857b9cbeceb404a5';
    }
  }

  getDio({@required int optionUrl}) async {
    var dio = Dio();

    Response response = await dio.get(urlForApi(optionUrl));

    if (response.statusCode == 200) {
      return NewsApiModel.fromjson(response.data);
    } else {
      print('Error de URL');
    }
  }
}
