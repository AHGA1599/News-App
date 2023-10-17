import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zdapi/news/dedelis_news.dart';
import 'package:http/http.dart' as http;

import '../api/api_conctans.dart';
import '../api/api_manger.dart';
import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'news_item.dart';

class NewsContener extends StatefulWidget {
  Source source;
  NewsContener({required this.source});

  @override
  State<NewsContener> createState() => _NewsContenerState();
}

int limit = 20;
int page = 0;
bool hasNextPage = true;
bool isLoadMoreRunning = false;
bool isFirstLoadRunning = false;
List poste = [];

class _NewsContenerState extends State<NewsContener> {
  late ScrollController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController()
      ..addListener(() {
        loadMore();
      });
  }

  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('someThing went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: Text('Try Agein'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: Text('Try Agein'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DeteailsNews.routeName,
                        arguments: newsList[index]);
                  },
                  child: NewsItem(news: newsList[index]));
            },
            itemCount: newsList.length,
           
          );
        });
  }

  void loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false) {
      setState(() {
        isLoadMoreRunning == true;
      });
      page += 1;
      try {
        var respons =
            await http.get(Uri.parse(ApiConstants.baseUrl, page, limit));
        final List fetchedposts = jsonDecode(respons.body);
        if (fetchedposts.isNotEmpty) {
          setState(() {
            poste.addAll(fetchedposts);
          });
        } else {
          setState(() {
            hasNextPage == false;
          });
        }
      } catch (e) {
        if (kDebugMode) {
          print('something went wrong!');
        }
      }
      setState(() {
        isLoadMoreRunning == false;
      });
    }
  }
}
