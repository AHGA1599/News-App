
import 'package:flutter/material.dart';

import '../model/SourceResponse.dart';
import '../my_theme.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: MyTheme.primryLightColor,
          width: 3,
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: isSelected
            ? Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: MyTheme.whiteColor)
            : Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
