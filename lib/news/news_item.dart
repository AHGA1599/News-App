
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'dedelis_news.dart';
import '../model/NewsResponse.dart';
import '../my_theme.dart';

class NewsItem extends StatefulWidget {
  News news;
  NewsItem({required this.news, });

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
              imageUrl: widget.news.urlToImage ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                )),
               errorWidget: (context, url, error) => Icon(Icons.error),
            ),)

          ),
          SizedBox(height: 10,),
          Text(
            widget.news.author ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),SizedBox(height: 10,),
          Text(widget.news.title ?? '',
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 10,),
          Text(widget.news.publishedAt??'',
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: MyTheme.greyColor)),
        ],
      ),
    );
  }


  }

