import 'article_model.dart';

class ApiResultModel {
  String status;
  int totalResults;
  List<Articles> articles;

  ApiResultModel({this.status, this.totalResults, this.articles});

  ApiResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (totalResults != null) {
      data['articles'] = articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Source {
  String id;
  String name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}