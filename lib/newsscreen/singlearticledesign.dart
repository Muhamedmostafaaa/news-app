import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articleresponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';
class singlearticldesign extends StatelessWidget {
  static final ROUTE_NAME = 'singlearticl';

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(

            article!.source!.name.toString(),

            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          toolbarHeight: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)),
          ))
      , body: Container(padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          SizedBox(height: 15,),
          CachedNetworkImage(
            imageUrl: article.urlToImage.toString(),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(
                    value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          SizedBox(height: 10,),
          Text(article.source!.name.toString(), textAlign: TextAlign.start,
            style: TextStyle(color: Color(0xff79828b)),),
          SizedBox(height: 10,),
          Text(article.title.toString(), style: TextStyle(fontSize: 16)),
          SizedBox(height: 10,),
          Text(article.publishedAt.toString(), textAlign: TextAlign.end,
            style: TextStyle(color: Color(0xff79828b)),),
          SizedBox(height: 20,),
          Text(article.content.toString(),
            style: TextStyle(color: Color(0xff42505C)),),
          SizedBox(height: 25
            ,),
          InkWell(onTap: () async {
            launch(article.url.toString());
          },
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('view full article'), Icon(Icons.play_arrow)
              ],
            ),
          )

        ],
      ),
    ),
    );
  }
}