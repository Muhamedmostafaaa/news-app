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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Articleresponse>(
      future: getdata(), builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(itemCount: snapshot.data!.articles!.length,itemBuilder: (context, index) =>
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

  Future<Articleresponse> getdata() async {
    Uri uri = Uri.https('newsapi.org', '/v2/everything', {
      'apiKey': 'e8029b498b744fc39fc86211348d7850',
      'sources': widget.source.id
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


