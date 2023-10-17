import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/NewsResponse.dart';
import '../my_theme.dart';




class DeteailsNews extends StatefulWidget {
static const String routeName='deteailNews';

  @override
  State<DeteailsNews> createState() => _DeteailsNewsState();
}

class _DeteailsNewsState extends State<DeteailsNews> {
  @override
  Widget build(BuildContext context) {
    var newsArgs = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),


      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: newsArgs.urlToImage ?? '',
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
              newsArgs.author ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),SizedBox(height: 10,),
            Text(newsArgs.title ?? '',
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10,),
            Text(newsArgs.content??'',style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20,fontWeight: FontWeight.w200),),
            SizedBox(height: 10,),
            Text(newsArgs.publishedAt??'',
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: MyTheme.greyColor)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              newsArgs.url??'';
              setState(() {

              });
            }, child: Text('view more'))

          ],
        ),
      ),
    );
  }
}
