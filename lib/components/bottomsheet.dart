

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:indiahealth_news/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:indiahealth_news/components/components.dart';

void showMyBottomSheet(BuildContext context, String title, String description,imageurl,url){
  showBottomSheet(
    backgroundColor: AppColors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),topRight: Radius.circular(20)
      )
    ),
    elevation: 20,
    context: context,
    builder: (context){
      return MyBottomSheetLayout(
        url:url,
        imageurl:imageurl,
        title:title,
        description:description
      );
    }
  );
}

_launchURL(String url) async {
  if(await canLaunch(url)){await launch(url);}
  else{throw 'Could not launch $url';}
}

class MyBottomSheetLayout extends StatelessWidget{
  final String title,description,imageurl,url;
  const MyBottomSheetLayout(
    {Key? key,
    required this.imageurl,
    required this.title,
    required this.description,
    required this.url})
    :super(key: key);
    @override
    Widget build (BuildContext context){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageurl:imageurl,title:title),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Read full article',
                    recognizer: TapGestureRecognizer()
                    ..onTap=(){
                      _launchURL(url);
                    },style: TextStyle(
                    color:AppColors.green)
                  )
                ]
              ),
            ),
          )
        ],
      )
      );
      
    }
}
