import 'package:flutter_latihan_bloc/model/article_model.dart';
import 'package:http/http.dart' as http;

abstract class ArticleRepo {
  //get
  Future<List<Articles>> getArticle();
  //post
  //put
  
  //delete
}

class ArticleRepoImpl implements ArticleRepo {
  //get
  Future<List<Articles>> getArticle() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=feef2e8d398046beadc227f9fea78c12"));
  }
  //put
  //post
  //delete
}
