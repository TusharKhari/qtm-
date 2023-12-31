import 'package:flutter/material.dart';
import 'package:news_app/screens/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

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
            ? Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: const CircularProgressIndicator(
                  color: Colors.blue,
                ))
            : 
            Consumer<NewsProvider>(
                builder: (context, newsProvider, child) {
                  if (newsProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (newsProvider.error.isNotEmpty) {
                    return Text('Error: ${newsProvider.error}');
                  } else {
                    // Use the data from the provider here
                    final newsModel = newsProvider.newsModel;
                    // Render  UI based on the data
                    return
                     Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: newsModel.articles!.length,
                          itemBuilder: (BuildContext context, int idx) {
                            String d =  newsModel.articles![idx].publishedAt ?? ""; 
                        final DateTime time1 =  DateTime.parse(d); 
                            return 
                            // ==========
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 7,
                                child: Container(
                             
                                  decoration: BoxDecoration(
                                    boxShadow: [ 
                                        BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 0 , spreadRadius: 0), 
                                      BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 0 , spreadRadius: 0), 
                                      BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 0 , spreadRadius: 0), 
                                      BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 1 , spreadRadius: 1), 
                                
                                        ], 
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey, 
                                    ), 
                                    borderRadius: const BorderRadius.all(Radius.circular(10))
                                  ),
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
                                          const Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 10,
                                            ),
                                          ),
                                          Text(
                                            //  snapshot.data["articles"][idx]["publishedAt"] ?? "NA",
                                            // date
                                           "${timeago.format(time1)}  ${newsModel.articles![idx].source!.name!}" ?? "NA",
                                
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 5.0),
                                          SizedBox( 
                                         width: 50.w,
                                            child: Text( 
                                              newsModel.articles![idx].title
                                                  .toString(),
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4.0,
                                          ),
                                          SizedBox(
                                            width:50.w,
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 15),
                                              child: Text(
                                                // data["articles"][idx]
                                                //         ["description"] ??
                                                //     "NA",
                                                newsModel
                                                    .articles![idx].description
                                                    .toString(),
                                               // maxLines: 3,
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.blue,
                                                ),
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
                            );
                         
                         ////// 
                         ///
                      
                          }),
                    );
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
                offset: const Offset(
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
              const Text("      "),
              const Icon(
                Icons.search,
                color: Colors.blue,
                size: 50,
                shadows: <Shadow>[Shadow(color: Colors.grey, blurRadius: 10.0)],
              ),
              //
              SizedBox(
                  width: 62.w,
                  child: TextField(
                    style: const TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                      hintText: "Search in feed ",
                      hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                    ),
                    onSubmitted: (value) {
                      provider.getDataFromSearch(value);
                    },
                  )),
              IconButton(
                  onPressed: () async {
                    await provider.logOut(context);
                  },
                  icon: const Icon(
                    Icons.logout_sharp,
                    color: Colors.blue,
                    size: 50,
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
