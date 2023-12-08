

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:indiahealth_news/utils/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(  //using http get method to access ot fetch data from news api
    Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=health&pageSize=50&apiKey='+Key.key)
  );
  Map result = jsonDecode(response.body); //convert json data obtained from response body to map/dictionary
  // ignore: avoid_print
  print('Fetched');
  return result['articles'];
  // refer postman
  //the articles key in response body contains the dicationary/map of required data 
}