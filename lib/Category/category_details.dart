import 'package:flutter/material.dart';
import 'package:zdapi/category_DM.dart';
import 'package:zdapi/up_tabs/tab_container.dart';
import '../api/api_manger.dart';
import '../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'categorydetails';
  CategoryDM categoryDM;
  CategoryDetails({required this.categoryDM});


  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse>(
          future: ApiManager.getSources(widget.categoryDM.id),
          // data from server
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
              // if error form user (WiFi - ...)
            } else if (snapshot.hasError) {
              //clint
              return Center(
                child: Column(
                  children: [
                    Text(" Something went wrong "),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getSources(widget.categoryDM.id);
                          setState(() {});
                        },
                        child: Text("Try Again"))
                  ],
                ),
              );
            }
            //server has response
            if (snapshot.data?.status != 'ok') {
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.message ?? ''),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getSources(widget.categoryDM.id);
                        },
                        child: Text("Try Again"))
                  ],
                ),
              );
            }
            // data has done
            var SourceList = snapshot.data?.sources ?? [];
            return TabContainer(sourceList: SourceList);
          }
    );
  }


}


