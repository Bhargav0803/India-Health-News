


import 'package:flutter/material.dart';
import 'package:indiahealth_news/backend/functions.dart';
import 'package:indiahealth_news/utils/colors.dart';
import 'package:indiahealth_news/utils/constants.dart';
import 'package:indiahealth_news/components/appbar.dart';
import 'package:indiahealth_news/components/newsbox.dart';


class Home extends StatefulWidget {
  const Home({Key? key}): super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState(){ //when app loads then this state is initialized and the fetchnews function is called
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context){
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(//return something in future
                future: fetchnews(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return NewsBox(
                          url:snapshot.data![index]['url'],
                          imageurl:
                            snapshot.data![index]['urlToImage'] != null
                            ? snapshot.data![index]['urlToImage']
                            : Constants.imageurl,
                            title:snapshot.data![index]['title'],
                            time:snapshot.data![index]['publishedAt'],
                            description:snapshot.data![index]['description'].toString(),
                        );
                      },
                    );
                  }else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.green,
                    ),
                  );
                },
              ),
            ),
          )
      ],
      ),
    );
  }


}