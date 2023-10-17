import 'package:flutter/material.dart';
import 'package:zdapi/news/dedelis_news.dart';

import 'Category/category_details.dart';
import 'home_screen.dart';
import 'my_theme.dart';




void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),

        DeteailsNews.routeName :(context)=> DeteailsNews(),


      },
      theme: MyTheme.lightMode,

    );
  }
}
