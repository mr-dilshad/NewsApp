import 'package:bicsom/UI/webview_homescreen.dart';
import 'package:bicsom/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  final Article article;

  NewsCard({this.article});
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewHomeScreen(url: widget.article.url)));
      },
      child: Card(
        margin: EdgeInsets.all(12.0),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                width: double.infinity,
                height: 220,
                child: widget.article.urlToImage != null
                    ? Image.network(widget.article.urlToImage)
                    : Center(
                        child: Text('image not found'),
                      ),
              ),
              Text(
                widget.article.title,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.remove_red_eye),
                  Text('7.8M'),
                  Expanded(child: SizedBox()),
                  Text(widget.article.publishedAt)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
