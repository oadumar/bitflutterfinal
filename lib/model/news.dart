class NewsApiModel {
  String status;
  int totalResults;
  List<News> articlesList;

  NewsApiModel(this.status, this.totalResults, this.articlesList);

  NewsApiModel.fromjson(Map<String, dynamic> map) {
    var mapArticles = map['articles'] as List;

    status = map['status'];
    totalResults = map['totalResults'];
    articlesList = mapArticles.map((json) => News.fromjson(json)).toList();
  }
}

//  Estructura de datos que va a devolver el jSON.
//  Verificar en la página de newsapi.org
class News {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromjson(Map<String, dynamic> map) {
    source = Source.fromjson(map['source']);
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'];
    content = map['content'];
  }
}

class Source {
  String id;
  String name;

  Source(this.id, this.name);

  Source.fromjson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
