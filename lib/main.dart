import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:news_app/newsscreen/newsscreendesgin.dart';
import 'package:news_app/settingsscreen/settingsscreen.dart';
void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(primarySwatch: Palette.kToDark),
      routes: {
        newsscreendesign.ROUTE_NAME:(context)=>newsscreendesign(),
        settingsscreen.ROUTE_NAME:(context)=>settingsscreen()
      },
      initialRoute: settingsscreen.ROUTE_NAME,
    );
  }

}
class mythemedata {
  static final primarycolor = Color(0xff39A552);

}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff39a552, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffce5641 ),//10%
      100: const Color(0xffb74c3a),//20%
      200: const Color(0xffa04332),//30%
      300: const Color(0xff89392b),//40%
      400: const Color(0xff733024),//50%
      500: const Color(0xff5c261d),//60%
      600: const Color(0xff451c16),//70%
      700: const Color(0xff2e130e),//80%
      800: const Color(0xff170907),//90%
      900: const Color(0xff000000),//100%
    },
  );
}