import 'package:flutter/material.dart';
import 'package:zdapi/my_theme.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Language:',style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 3,color: Theme.of(context).primaryColor),


            ),
            child:InkWell(
              onTap: (){
                showLanguge();
                setState(() {

                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('English',style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.primryLightColor),),
                  Icon(Icons.arrow_drop_down,size: 30,color: MyTheme.primryLightColor,),

        ],
          ),
            )
          )],
      ),
    );
  }

  void showLanguge() {
    showBottomSheet(context: context, builder:(context) => Text('data'),
    );

  }
}
