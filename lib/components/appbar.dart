import 'package:flutter/material.dart';
import 'package:indiahealth_news/utils/colors.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget{

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context){
    return AppBar(
      actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("India Health ",style: TextStyle(color: AppColors.green,fontSize: 30,fontWeight: FontWeight.bold)),
          Text("News",style: TextStyle(color: AppColors.white,fontSize: 30,fontWeight: FontWeight.bold)),
        ]),
      ),
      centerTitle: true,
    );
  }
}