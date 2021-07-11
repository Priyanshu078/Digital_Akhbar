import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatefulWidget {
  Description(
      {Key key,
      @required this.pageTitle,
      @required this.title,
      @required this.urlToImage,
      @required this.content,
      @required this.description,
      @required this.url,
      @required this.color})
      : super(key: key);

  final String pageTitle;
  final String title;
  final String urlToImage;
  final String content;
  final String description;
  final String url;
  final Color color;

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  String text = "";
  customlaunch(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cannot Launch Url")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      text = widget.title + "\n" + widget.url;
    });
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.pageTitle),
        actions: [
          InkWell(
            onTap: () {
              Share.share(text);
            },
            child:
                Padding(padding: EdgeInsets.all(16), child: Icon(Icons.share)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: widget.urlToImage == null
                        ? Image.asset('assets/noimageavailable.png')
                        : Image.network(widget.urlToImage)),
                widget.title == null
                    ? Text(
                        "No title for this news",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                widget.description == null
                    ? Text(
                        "There is no description for this news",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      )
                    : Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                MaterialButton(
                  height: 40,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Read More",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    customlaunch(widget.url);
                  },
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
