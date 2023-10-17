import 'package:flutter/material.dart';
import 'package:zdapi/category_DM.dart';
import 'package:zdapi/my_theme.dart';

class CategoryItem extends StatelessWidget {
CategoryDM categoryDM;
int index;
CategoryItem ({required this.categoryDM , required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDM.color,
        borderRadius: BorderRadius.only(
          bottomRight:Radius. circular (index%2==0 ? 0 : 20),
          bottomLeft: Radius. circular (index%2==0 ? 20 : 0),
          topLeft: Radius.circular(20),
          topRight:Radius.circular(20) ,
        )
      ),
child: Column(
  children: [
    Image.asset(categoryDM.image,height: MediaQuery.of(context).size.height*0.15),
    Text(categoryDM.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.whiteColor),),
  ],
),
    );
  }
}
