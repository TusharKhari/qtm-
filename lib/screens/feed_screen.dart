// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  var data;
  Future<void> getNews() async {
    final res = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=59afb6110da4447581a5863c2e1ce4ee",
    ));
    if (res.statusCode == 200) {
      data = jsonDecode(res.body.toString());
    } else {
      data = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: const Row(
            children: [
              Text("      "),
              Icon(
                Icons.search,
                color: Colors.blue,
                size: 50,
                shadows: <Shadow>[Shadow(color: Colors.grey, blurRadius: 10.0)],
              ),
              Text("  Search in a feed ")
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: getNews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  padding: EdgeInsets.all(10),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int idx) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                        child: SizedBox(
                          height: 150,
                          child: Card(
                            elevation: 2.0,
                            color: Colors.white,
                            //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                            // height: 130,
                            // decoration: BoxDecoration(
                            //   //color: Colors.green,
                            //   borderRadius: BorderRadius.all(Radius.circular(10)),
                            //   border: Border.all(color: Colors.grey),
                            // ),
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
                                      data["articles"][idx]["publishedAt"],
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      
                                      child: Text(
                                        data["articles"][idx]["title"], maxLines: 2
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
                                        data["articles"][idx]["description"],
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
                                  data["articles"][idx]["urlToImage"],
                                  width: 110,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
        )
      ]),
    );
  }
}
