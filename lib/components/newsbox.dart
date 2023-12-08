
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:indiahealth_news/components/components.dart';
import 'package:indiahealth_news/utils/colors.dart';
import 'package:indiahealth_news/components/bottomsheet.dart';



class NewsBox extends StatelessWidget{
  final String imageurl,title,time,description,url;
  const NewsBox(
    {Key? key,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.description,
    required this.url,
    }
  ):super(key: key);

  @override
  Widget build(BuildContext context){
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: (){
            showMyBottomSheet(context,title,description,imageurl,url);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
            width: w,
            color: AppColors.black,
            child: Row(children: [
              CachedNetworkImage(
                imageUrl: imageurl,
                imageBuilder: (context,ImageProvider)=>Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: ImageProvider,fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                ),
                placeholder: (context,url)=>
                CircularProgressIndicator(color: AppColors.green),
                errorWidget: (context,url,error)=>Icon(Icons.error),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,style: TextStyle(color: AppColors.white,fontSize: 16)),
                      Text(time,style: TextStyle(color: AppColors.white,fontSize: 16)),                    
                  ]
                  ),
                )
            ]),
          ),
        ),
        DividerWidget()
      ],
    );
  }

}