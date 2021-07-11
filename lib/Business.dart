import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapp/Description.dart';

import '../News.dart';

class Business extends StatefulWidget {
  Business(
      {Key key,
      @required this.title,
      @required this.endpoint,
      @required this.color})
      : super(key: key);
  final String title;
  final String endpoint;
  final Color color;
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  String title = "";
  String urlToImage = "";
  String description = "";
  String content = "";
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: widget.color,
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Business(
                              title: widget.title,
                              endpoint: widget.endpoint,
                              color: widget.color,
                            )));
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.refresh),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: Data.getData(
            endpoint: widget.endpoint,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: widget.color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                title = snapshot.data[index].title;
                                urlToImage = snapshot.data[index].urlToImage;
                                description = snapshot.data[index].description;
                                content = snapshot.data[index].content;
                                url = snapshot.data[index].url;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Description(
                                            pageTitle: widget.title,
                                            title: title,
                                            urlToImage: urlToImage,
                                            content: content,
                                            description: description,
                                            url: url,
                                            color: widget.color,
                                          )));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:
                                        snapshot.data[index].urlToImage == null
                                            ? Image.asset(
                                                'assets/noimageavailable.png',
                                                fit: BoxFit.fitHeight,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                              )
                                            : Image.network(
                                                snapshot.data[index].urlToImage,
                                                fit: BoxFit.fitHeight,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                              ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (2 / 3),
                                        child: Text(
                                          snapshot.data[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data[index].publishedAt,
                                            textAlign: TextAlign.left,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Text(
                                                "Tap Me",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              )),
                                        ])
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                print("Error");
              } else {
                return CircularProgressIndicator();
              }
            }
            return Center(
                child: CircularProgressIndicator(
              color: widget.color,
            ));
          },
        ));
  }
}
