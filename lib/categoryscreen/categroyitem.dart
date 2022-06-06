import 'package:flutter/material.dart';
import 'package:news_app/categoryscreen/categroydesign.dart';

class categroyitem extends StatelessWidget {
  String text;
  var imagepath;
  var color;
  bool isright;
  Function categroyselected;
  String id;
  categroyitem(
      {required this.text, required this.imagepath, required this.color, required this.isright,required this.categroyselected,required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      categroyselected(id);
    },
      child: Container(
        width: 148, height: 171,
        decoration: BoxDecoration(
            borderRadius: isright ? BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)):BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
          color:Color(color)
        ),child:
        Column(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [

           Image.asset(imagepath),

            Text(text,style: TextStyle(fontSize: 22,color: Colors.white),),

          ],
        ),
      ),
    );
  }

}