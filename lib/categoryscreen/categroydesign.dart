import 'package:flutter/material.dart';
import 'package:news_app/categoryscreen/categroyitem.dart';

class categroy extends StatelessWidget {
  Function categroyselected;
  categroy(this.categroyselected);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Pick your category of interset',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff4F5A69)),
        ),
        SizedBox(height: 20,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            categroyitem(
                text: 'Sports',
                imagepath: 'assets/images/sports_logo.png',
                color: 0xffC91C22,
                isright: false,categroyselected:categroyselected,id:'sports' ,),
            categroyitem(
                text: 'Politics',
                imagepath: 'assets/images/Politics_logo.png',
                color: 0xff003E90,
                isright: true,categroyselected: categroyselected,id:'general' ,)
          ],
        ),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            categroyitem(
                text: 'Health',
                imagepath: 'assets/images/health_logo.png',
                color: 0xffED1E79,
                isright: false,categroyselected: categroyselected,id:'health' ,),
            categroyitem(
                text: 'Bussines',
                imagepath: 'assets/images/bussines_logo.png',
                color: 0xffCF7E48,
                isright: true,categroyselected: categroyselected,id:'business' ,)
          ],
        ),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            categroyitem(
                text: 'Environment',
                imagepath: 'assets/images/environment_kogo.png',
                color: 0xff4882CF,
                isright: false,categroyselected: categroyselected,id:'entertainment' ,),
            categroyitem(
                text: 'Science',
                imagepath: 'assets/images/bussines_logo.png',
                color: 0xffF2D352,
                isright: true,categroyselected:categroyselected ,id:'science' ,)
          ],
        )
      ],
    );
  }
}
