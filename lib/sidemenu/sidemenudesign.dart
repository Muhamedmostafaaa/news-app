import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class sidemenu extends StatefulWidget {
   Function clearcategroy;
   sidemenu(this.clearcategroy);


  @override
  State<sidemenu> createState() => _sidemenuState();
}

class _sidemenuState extends State<sidemenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              'News App!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
            color: mythemedata.primarycolor,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ImageIcon(AssetImage('assets/images/rows_logo.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: (){
               widget.clearcategroy();
                },
                  child: Text(
                    'category',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ImageIcon(AssetImage('assets/images/settings_logo.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('settings',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        )
      ],
    );
  }
}
