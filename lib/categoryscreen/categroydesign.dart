import 'package:flutter/material.dart';
import 'package:news_app/categoryscreen/categroyitem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class categroy extends StatelessWidget {
  Function categroyselected;
  categroy(this.categroyselected);
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.pick,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff4F5A69)),
          ),
          SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categroyitem(
                  text:  AppLocalizations.of(context)!.sports,
                  imagepath: 'assets/images/sports_logo.png',
                  color: 0xffC91C22,
                  isright: false,categroyselected:categroyselected,id:'sports' ,),
              categroyitem(
                  text:  AppLocalizations.of(context)!.politics,
                  imagepath: 'assets/images/Politics_logo.png',
                  color: 0xff003E90,
                  isright: true,categroyselected: categroyselected,id:'general' ,)
            ],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categroyitem(
                  text:  AppLocalizations.of(context)!.health,
                  imagepath: 'assets/images/health_logo.png',
                  color: 0xffED1E79,
                  isright: false,categroyselected: categroyselected,id:'health' ,),
              categroyitem(
                  text:  AppLocalizations.of(context)!.bussines,
                  imagepath: 'assets/images/bussines_logo.png',
                  color: 0xffCF7E48,
                  isright: true,categroyselected: categroyselected,id:'business' ,)
            ],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categroyitem(
                  text:  AppLocalizations.of(context)!.environment,
                  imagepath: 'assets/images/environment_kogo.png',
                  color: 0xff4882CF,
                  isright: false,categroyselected: categroyselected,id:'entertainment' ,),
              categroyitem(
                  text:  AppLocalizations.of(context)!.science,
                  imagepath: 'assets/images/bussines_logo.png',
                  color: 0xffF2D352,
                  isright: true,categroyselected:categroyselected ,id:'science' ,)
            ],
          )
        ],
      ),
    );
  }
}
