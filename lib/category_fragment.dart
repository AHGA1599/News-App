import 'package:flutter/material.dart';
import 'package:zdapi/category_DM.dart';
import 'package:zdapi/category_item.dart';

class CategoryFragment extends StatelessWidget {
  List categoryList = CategoryDM.gitCategories();
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \n of interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onCategoryClick(categoryList[index]);

                  },
                    child: CategoryItem(
                        categoryDM: categoryList[index], index: index));
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
