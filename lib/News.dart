import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class News {
  String title, description, url, urlToImage, publishedAt, content;

  News(this.title, this.description, this.url, this.urlToImage,
      this.publishedAt, this.content);
}

class Data {
  static Future<List> getData({@required String endpoint}) async {
    var response = await http.get(Uri.parse(endpoint));
    var jsonData = jsonDecode(response.body);
    List newsData = [];
    for (var item in jsonData['articles']) {
      News news = new News(item['title'], item['description'], item['url'],
          item['urlToImage'], item['publishedAt'], item['content']);
      newsData.add(news);
    }
    return newsData;
  }
}
