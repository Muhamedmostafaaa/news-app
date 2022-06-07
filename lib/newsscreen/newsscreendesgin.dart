import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/categoryscreen/categroydesign.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/sourcesresponse.dart';
import 'package:news_app/newsscreen/newsfragment.dart';
import 'package:news_app/newsscreen/tabitem.dart';
import 'package:news_app/sidemenu/sidemenudesign.dart';

import '../model/articleresponse.dart';
import 'articledesign.dart';

class newsscreendesign extends StatefulWidget {
  static final ROUTE_NAME = 'HOME SCREEN';

  @override
  State<newsscreendesign> createState() => _newsscreendesignState();
}

class _newsscreendesignState extends State<newsscreendesign> {
  int selected = 0;
  String categroyselected = '';

  late Future<Sourcesresponse> sourcesresponse;

  initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: newssearch());
          }, icon:Icon (Icons.search))
        ],
          centerTitle: true,
          title: Text(
            categroyselected.isEmpty
                ? AppLocalizations.of(context)!.newsapp
                : categroyselected.toUpperCase(),
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
        child: sidemenu(clearcategroy),
      ),
      body: categroyselected.isEmpty
          ? categroy(selectedcategroy)
          : FutureBuilder<Sourcesresponse>(
              future: sourcesresponse,
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return DefaultTabController(
                    length: snapShot.data!.sources!.length,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        TabBar(
                            onTap: (index) {
                              setState(() {
                                selected = index;
                              });
                            },
                            indicatorColor: Colors.transparent,
                            isScrollable: true,
                            tabs: snapShot.data!.sources!
                                .map((source) => tabitem(
                                    snapShot.data!.sources!.indexOf(source) ==
                                        selected,
                                    source))
                                .toList()),
                        Expanded(
                            child: TabBarView(
                                children: snapShot.data!.sources!
                                    .map((source) => newsfragment(source))
                                    .toList()))
                      ],
                    ),
                  );
                } else if (snapShot.hasError) {
                  return Text(snapShot.error.toString());
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
    );
  }

  void clearcategroy() {
    setState(() {
      categroyselected = '';
      Navigator.pop(context);
    });
  }

  void selectedcategroy(String tapedcategroy) {
    setState(() {
      categroyselected = tapedcategroy;
      sourcesresponse = loaddata();
    });
    print(categroyselected);
  }

  Future<Sourcesresponse> loaddata() async {
    Uri uri = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
      'apiKey': 'e8029b498b744fc39fc86211348d7850',
      'category': categroyselected
    });
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Sourcesresponse.fromJson(jsonDecode(response.body));
    } else {
      throw (Exception(response.body));
    }
  }
}
class newssearch extends SearchDelegate{
 late  Future<Articleresponse>response ;
  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(onPressed: (){
       showResults(context);
     }, icon: Icon(Icons.search))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    response=getdataforsearch(query);
   return FutureBuilder<Articleresponse>(
     future: response, builder: (context, snapshot) {
     if (snapshot.hasData) {
       return ListView.builder(


           itemCount: snapshot.data!.articles!.length,itemBuilder: (context, index) =>
           articldesign(snapshot.data!.articles![index]));


     } else
     if(snapshot.hasError)
     {
       return Text('error');
     } else {
       return
         Center(child: CircularProgressIndicator(),);
     }
   },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
  }

}
