import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/sourcesresponse.dart';

class tabitem extends StatelessWidget {
  Sources source;
  bool isselected;

  tabitem(this.isselected, this.source);

  @override
  Widget build(BuildContext context) {
    return Tab(

      child:!isselected? Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20),
                border: Border.all(color: mythemedata.primarycolor,width: 2)),
        child: Text(
          source.name.toString(),
          style: TextStyle(color: mythemedata.primarycolor),
        ),
      ):Container(
        padding: EdgeInsets.all(10),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15),
           color:mythemedata.primarycolor),
        child: Text(
          source.name.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
