import 'package:flutter/material.dart';
import 'package:zdapi/Category/category_details.dart';
import 'package:zdapi/Settings_tab.dart';
import 'package:zdapi/home_drawer.dart';
import 'package:zdapi/my_theme.dart';
import 'package:zdapi/searching/searching.dart';

import 'category_DM.dart';
import 'category_fragment.dart';
import 'model/SourceResponse.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  Source source =Source() ;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/bg.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'NEWS',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Searching(source: widget.source,),);

                  },
                  icon: Icon(Icons.search)),
            ],
          ),
          drawer: Drawer(child: HomeDarower(onSideMenuItem:onSideMenuItem)),
          body: selectedMenuItem == HomeDarower.Settings ?
              SettingsTab():
          selectedCategory == null
              ? CategoryFragment(onCategoryClick: onCategoryClick)
              : CategoryDetails(categoryDM: selectedCategory!),
        ),
      ],
    );
  }

  CategoryDM? selectedCategory;
  void onCategoryClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDarower.Categories;
  void onSideMenuItem(int newsSelectedMenuItem) {
    selectedMenuItem = newsSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
}
}
