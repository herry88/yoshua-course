import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsappsflutter/models/articlemodel.dart';

import '../secret.dart';

class News {
  //deklarasi listnya
  List<Article> news = [];

//function getNEws
  Future<void> getNews() async {
    //variabel url
    String url =
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=${apiKey}";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    //logika
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
              articleUrl: element['url'],
            );
            news.add(article);
          }
        },
      );
    }
  }
}
