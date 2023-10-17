import 'package:flutter/material.dart';

class HomeDarower extends StatelessWidget {
static const int Categories =1;
static const int Settings =2;
  Function onSideMenuItem;
  HomeDarower ({required this.onSideMenuItem});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
          color: Theme.of(context).primaryColor,
          child: Text(
            'News App!',textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              onSideMenuItem(HomeDarower.Categories);

            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.list,size: 30,),
                  SizedBox(width: 10,),
                  Text('Categories',style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              onSideMenuItem(HomeDarower.Settings);

            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.settings,size: 30,),
                  SizedBox(width: 10,),
                  Text('Settings',style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
    ]));
  }
}
