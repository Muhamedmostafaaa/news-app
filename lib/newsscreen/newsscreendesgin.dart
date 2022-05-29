import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/model/sourcesresponse.dart';
import 'package:news_app/newsscreen/newsfragment.dart';
import 'package:news_app/newsscreen/tabitem.dart';

class newsscreendesign extends StatefulWidget {
  static final ROUTE_NAME = 'HOME SCREEN';

  @override
  State<newsscreendesign> createState() => _newsscreendesignState();
}

class _newsscreendesignState extends State<newsscreendesign> {
  int selected = 0;

  Future<Sourcesresponse> sourcesresponse = loaddata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News app',
            style: TextStyle(color: Colors.white),
          ),
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)),
          )),
      drawer: ,
      body: FutureBuilder<Sourcesresponse>(
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
}

Future<Sourcesresponse> loaddata() async {
  Uri uri = Uri.https('newsapi.org', '/v2/top-headlines/sources',
      {'apiKey': 'e8029b498b744fc39fc86211348d7850'});
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return Sourcesresponse.fromJson(jsonDecode(response.body));
  } else {
    throw (Exception(response.body));
  }
}
