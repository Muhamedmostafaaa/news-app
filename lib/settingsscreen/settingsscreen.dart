

import 'package:flutter/material.dart';
import 'package:news_app/Provider/languageprovider.dart';
import 'package:news_app/main.dart';
import 'package:news_app/newsscreen/newsscreendesgin.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../sidemenu/sidemenudesign.dart';

class settingsscreen extends StatefulWidget {
  static final ROUTE_NAME = 'settings screen';



  @override
  State<settingsscreen> createState() => _settingsscreenState();
}

class _settingsscreenState extends State<settingsscreen> {
  @override

  Widget build(BuildContext context) {
    final providr = Provider.of<Languageprovider>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)),
          )),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: sidemenu(settingsfunction),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: mythemedata.primarycolor, width: 2),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    providr.local=='en'?'English':'Arabic',
                    style: TextStyle(
                        fontSize: 14, color: mythemedata.primarycolor),
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      openbottomsheet(providr);
                    },
                    icon: Icon(
                      Icons.arrow_downward,
                      color: mythemedata.primarycolor,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openbottomsheet(Languageprovider provider) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(onTap: (){
                      if(provider.local=='ar'){
                        provider.changelocal();
                      }
                      Navigator.pop(context);
                    },
                        child:
                    rowdetails('english', provider.local=='en')),
                    SizedBox(height: 30),
                    InkWell(onTap: (){
                      if(provider.local=='en'){
                        provider.changelocal();
                      }
                      Navigator.pop(context);
                    },
                        child: rowdetails('arabic', provider.local=='ar'))
                  ],
                ),
              ));
        });
  }

  void settingsfunction() {
    Navigator.pushNamed(context, newsscreendesign.ROUTE_NAME);
  }

  Widget rowdetails(String text, bool isselected) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18,
              color: isselected ? mythemedata.primarycolor : Colors.black),
        ),
        Spacer(),
        isselected
            ? Icon(
                Icons.check,
                color: mythemedata.primarycolor,
              )
            : Container()
      ],
    );
  }
}
