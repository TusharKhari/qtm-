// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  void initState() {
    final provider = Provider.of<NewsProvider>(context, listen: false);
    provider.getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    return Scaffold(
      body: Column(children: [
        _appBar(context),
        provider.isLoading
            ? Center(child: CircularProgressIndicator())
            : Consumer<NewsProvider>(
                builder: (context, newsProvider, child) {
                  if (newsProvider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (newsProvider.error.isNotEmpty) {
                    return Text('Error: ${newsProvider.error}');
                  } else {
                    // Use the data from the provider here
                    final newsModel = newsProvider.newsModel;
                    // Render your UI based on the data
                    return Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: newsModel.articles!.length,
                          itemBuilder: (BuildContext context, int idx) {
                            return Padding(
                              padding:
                                  EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                              child: SizedBox(
                                height: 150,
                                child: Card(
                                  elevation: 2.0,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 10,
                                            ),
                                          ),
                                          Text(
                                            //  snapshot.data["articles"][idx]["publishedAt"] ?? "NA",
                                            newsModel.articles![idx].publishedAt
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              // data["articles"][idx]["title"] ??
                                              //     "NA",
                                              newsModel.articles![idx].title
                                                  .toString(),
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.0,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              // data["articles"][idx]
                                              //         ["description"] ??
                                              //     "NA",
                                              newsModel
                                                  .articles![idx].description
                                                  .toString(),
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.network(
                                        // data["articles"][idx]["urlToImage"] ??
                                        //     "https://perfectstart.com.au/wp-content/uploads/2017/08/not-available.jpg",
                                        newsModel.articles![idx].urlToImage
                                                .toString() ??
                                            "https://perfectstart.com.au/wp-content/uploads/2017/08/not-available.jpg",
                                        width: 110,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //
                              //  Text("data")
                            );
                          }),
                    );
                    ;
                  }
                },
              ),

        //===========
      ]),
    );
  }
}

Widget _appBar(BuildContext context) {
         final provider = Provider.of<NewsProvider>(context);

  return Padding(
    padding: EdgeInsets.only(top: 2.h),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 82,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 10, // Blur radius
                offset: Offset(
                    0, 3), // Offset to control the direction of the shadow
              ),
            ],
          ),
        ),
        Container(
          //  margin:   EdgeInsets.only(top: 50.h),
          height: 80,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), color: Colors.white),
          child: Row(
            children: [
              Text("      "),
              Icon(
                Icons.search,
                color: Colors.blue,
                size: 50,
                shadows: <Shadow>[Shadow(color: Colors.grey, blurRadius: 10.0)],
              ),
              //
              SizedBox(
                  width: 80.w,
                  child: TextField(
                    cursorHeight: 0,
                    cursorWidth: 0,
                    decoration: InputDecoration(
                      hintText: "Search in feed ",
                      hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                      border: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                    ),
                    onSubmitted: (value) {
                    provider.getDataFromSearch(value);
                    },
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}

/**
 
  ListView.builder(
                  padding: EdgeInsets.all(10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int idx) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                        child: SizedBox(
                          height: 150,
                          child: Card(
                            elevation: 2.0,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          height: 10,
                                        ),),
                                    Text(
                                   snapshot.data["articles"][idx]["publishedAt"] ?? "NA",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),                               
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                                                     child: Text(
                                        data["articles"][idx]["title"] ?? "NA", maxLines: 2
                                          , style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),),
                                    ),
                                    SizedBox(height: 4.0,),
                                    SizedBox(
                                      width:
                                       MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        data["articles"][idx]["description"] ?? "NA" ,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Image.network(
                                  data["articles"][idx]["urlToImage"] ?? "https://perfectstart.com.au/wp-content/uploads/2017/08/not-available.jpg",
                                  width: 110,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });

 */
