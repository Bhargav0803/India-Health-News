


import 'package:flutter/material.dart';
import 'package:indiahealth_news/utils/colors.dart';
import 'package:indiahealth_news/pages/home.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatefulWidget{
  const MyApp({Key?key}):super(key: key);
  @override
  _MyAppState createState()=> _MyAppState();

}
class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,primaryColor: AppColors.black
      ),
      home: Home(),
    );
  }
}