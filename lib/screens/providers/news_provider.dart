
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/new_model.dart';

class NewsProvider extends ChangeNotifier{
  static const apiEndPoint =     "https://newsapi.org/v2/everything?q=india&apiKey=59afb6110da4447581a5863c2e1ce4ee";

  bool isLoading = true;
  String error = "";
  String searchText = '';
     var data ;

     NewsModel news = NewsModel(); 
     
    getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndPoint));
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      } else {
        error = response.statusCode.toString();
        print(data.toString());
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }

    updateData() {
    notifyListeners();
  }

  search(String newsWord) async{
      try {
      Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/$newsWord?q=india&apiKey=59afb6110da4447581a5863c2e1ce4ee",
        ));
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }
}