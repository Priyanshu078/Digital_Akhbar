import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Business.dart';

class Categories extends StatefulWidget {
  final String title;
  Categories({Key key, @required this.title}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Headlines",
    "Business",
    "Entertainment",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];

  List<String> assets = [
    "assets/headlines.png",
    "assets/businesss.png",
    "assets/entertainment.png",
    "assets/health.png",
    "assets/science.png",
    "assets/sports.png",
    "assets/technology.png"
  ];

  List<String> endpoints = [
    "https://newsapi.org/v2/top-headlines?country=in&apiKey=5e1ab9bd747b44a9b6d5ea353a26fba9",
    "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=5e1ab9bd747b44a9b6d5ea353a26fba9",
    "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=5e1ab9bd747b44a9b6d5ea353a26fba9",
    "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=5e1ab9bd747b44a9b6d5ea353a26fba9",
    "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=5e1ab9bd747b44a9b6d5ea353a26fba9",
    "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=5e1ab9bd747b44a9b6d5ea353a26fba9",
    "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=5e1ab9bd747b44a9b6d5ea353a26fba9",
  ];

  List<Color> colors = [
    Colors.orange,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.greenAccent,
    Colors.lime,
    Colors.amber,
    Colors.purpleAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: colors[index],
            highlightColor: colors[index],
            hoverColor: colors[index],
            focusColor: colors[index],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Business(
                            title: categories[index],
                            endpoint: endpoints[index],
                            color: colors[index],
                          )));
            },
            child: Container(
              height: (MediaQuery.of(context).size.height - 50) / 7,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Image.asset(assets[index]),
                      ),
                      Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}
