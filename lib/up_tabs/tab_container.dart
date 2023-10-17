
import 'package:flutter/material.dart';
import 'package:zdapi/up_tabs/tab_item_coustom.dart';

import '../model/SourceResponse.dart';
import '../news/news_contener.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourceList;

  TabContainer({required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedItem=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedItem = index;
                setState(() {

                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sourceList
                  .map((source) => TabItem(
                  source: source,
                  isSelected: selectedItem == widget.sourceList.indexOf(source)))
                  .toList(),
            ),
            Expanded(child: NewsContener(source: widget.sourceList[selectedItem])),
          ],
        ));
  }
}
