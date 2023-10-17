import 'package:flutter/material.dart';

import '../api/api_manger.dart';
import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import '../news/news_item.dart';

class Searching extends SearchDelegate {
  Source source;
  //News news;
  Searching(
      { //required this.news,
      required this.source});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsBySourceId(source.id ?? ''),
        builder: (context, snapshot) {
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsBySourceId(source.id ?? ''),
        builder: (context, snapshot) {
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
