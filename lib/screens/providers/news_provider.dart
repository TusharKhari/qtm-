import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/auth_screen.dart';

class NewsProvider extends ChangeNotifier {
  static const apiEndPoint =
      "https://newsapi.org/v2/everything?q=india&apiKey=59afb6110da4447581a5863c2e1ce4ee";

  bool isLoading = true;
  String error = "";
  String searchText = '';
  var data;

  NewsModel newsModel = NewsModel();

  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndPoint));
      if (response.statusCode == 200 || response.statusCode == 201) {
        data = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(data);
        isLoading = false;
        notifyListeners();
      } else {
        error = response.statusCode.toString();
      //  print(data.toString());
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
    // updateData();
  }

  // updateData() {
  //   notifyListeners();
  // }

  getDataFromSearch(String newsWord) async {
    try {
      isLoading = true;
      Response response = await http.get(Uri.parse(
       // "https://newsapi.org/v2/everything?q=$newsWord&from=2023-09-07&sortBy=popularity&apiKey=59afb6110da4447581a5863c2e1ce4ee",
       "https://newsapi.org/v2/everything?q=$newsWord&apiKey=59afb6110da4447581a5863c2e1ce4ee",
      ));
      if (response.statusCode == 200) {
        //data = jsonDecode(response.body);
        data = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(data);
        print(response.body.toString());
       // print(newsModel.totalResults);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
    // updateData();
  }

  bool isSigningIn =false;
  final googleSignIn = GoogleSignIn(
    clientId: "49016362281-em5g5sbrmdng1bn1jaakrtomcupcg1gt.apps.googleusercontent.com"
  );
  Future googleLogin() async {
    
    final user = await googleSignIn.signIn();
    if(user != null) isSigningIn = true;
    notifyListeners();
    if(user != null) isSigningIn = true;
   // print(user); 
  }
   Future logOut(BuildContext context) async {
    isSigningIn = false;   
     final isSignOut = await googleSignIn.signOut();
     if(isSignOut == null  ) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthScreen(),));
     }
    // print(user); 
  }
}
