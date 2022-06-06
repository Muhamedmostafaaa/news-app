import 'package:flutter/material.dart';

class Languageprovider extends ChangeNotifier{
  String local='en';
  void changelocal(){
    if(local=='en'){
      local='ar';
    }else{
      local= 'en';

    }
    notifyListeners();
  }
}