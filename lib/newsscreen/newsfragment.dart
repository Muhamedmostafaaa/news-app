import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/articleresponse.dart';
import 'package:news_app/model/sourcesresponse.dart';
import 'package:news_app/newsscreen/articledesign.dart';
import 'package:news_app/newsscreen/newsscreendesgin.dart';


class newsfragment extends StatefulWidget {
  Sources source;

  newsfragment(this.source);

  @override
  State<newsfragment> createState() => _newsfragmentState();
}

class _newsfragmentState extends State<newsfragment> {
  int page=1;
  late Future<Articleresponse>response;

  final controller = ScrollController();
  initState(){
    response=getdata(page: page);
    controller.addListener(() {
      if (controller.position.atEdge) {
       if (controller.position.pixels == 0){


        } else {

          response.then((articleresponse)  {
            getdata(page: page++).then((articleresponse2)  {
              if(articleresponse2.status=='ok') {

                setState(() {
                  articleresponse.articles!.addAll(
                      articleresponse2.articles!.toList());
                });
              }
            });
          });
        }
    }});
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Articleresponse>(
      future: response, builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
            controller: controller,

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

  Future<Articleresponse> getdata({int page=1}) async {
    Uri uri = Uri.https('newsapi.org', '/v2/everything', {
      'apiKey': 'e8029b498b744fc39fc86211348d7850',
      'sources': widget.source.id,'page':'$page'
    });
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      return Articleresponse.fromJson(jsonDecode(response.body));
    } else {
      throw(Exception(response.body));
    }
  }

}
Future<Articleresponse> getdataforsearch(query) async {
  Uri uri = Uri.https('newsapi.org', '/v2/everything', {
    'apiKey': 'e8029b498b744fc39fc86211348d7850',
    'q':query
  });
  final response = await http.get(uri);
  print(response.body);
  if (response.statusCode == 200) {
    return Articleresponse.fromJson(jsonDecode(response.body));
  } else {
    throw(Exception(response.body));
  }
}

