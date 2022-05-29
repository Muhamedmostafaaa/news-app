import 'package:flutter/material.dart';
import 'package:news_app/model/articleresponse.dart';

class articldesign extends StatelessWidget{
  Articles article;
  articldesign(this.article);
  @override
  Widget build(BuildContext context) {
   return Container(padding: EdgeInsets.all(10),
     child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,

       children: [
         SizedBox(height: 15,),
         Image.network(article.urlToImage.toString()),

         SizedBox(height: 10,),
        Text(article.source!.name.toString(),textAlign: TextAlign.start,style: TextStyle(color: Color(0xff79828b)),),
         SizedBox(height: 10,),
       Text(article.title.toString(),style:TextStyle(fontSize:16)),
         SizedBox(height: 10,),
         Text(article.publishedAt.toString(),textAlign: TextAlign.end,style:TextStyle(color:Color(0xff79828b)),)

       ],
     ),
   );
  }

}