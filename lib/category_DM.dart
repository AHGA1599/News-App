import 'package:flutter/material.dart';
import 'package:zdapi/my_theme.dart';

class CategoryDM {
  String id;
  String title;
  String image;
  Color color;

  CategoryDM(
      {required this.id,
      required this.title,
      required this.color,
      required this.image});

/*

general



technology*/
   static List<CategoryDM>gitCategories(){
     return[
       CategoryDM(id: 'sports', title: 'Sports', color: MyTheme.redColor, image: 'assets/images/ball.png'),
       CategoryDM(id: 'general', title: 'General', color: MyTheme.blueColor, image: 'assets/images/Politics.png'),
       CategoryDM(id: 'health', title: 'Health', color: MyTheme.pinkColor, image: 'assets/images/health.png'),
       CategoryDM(id: 'business', title: 'Business', color: MyTheme.brownColor, image: 'assets/images/bussines.png'),
       CategoryDM(id: 'entertainment', title: 'Entertainment', color: MyTheme.darkBlueColor, image: 'assets/images/environment.png'),
       CategoryDM(id: 'science', title: 'Science', color: MyTheme.yellowColor, image: 'assets/images/science.png'),


     ];

  }


}
