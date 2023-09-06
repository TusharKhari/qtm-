
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import 'package:news_app/screens/feed_screen.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';
import '../google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignin googleSignIn = GoogleSignin();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 100.w,
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:   EdgeInsets.only(left: 8.w, top: 8),
                child: Row(
                  children: [
                 Text("SignIn into Your", style: TextStyle(  fontSize: 25, fontWeight: FontWeight.bold , color: GlobalVar.red,
                    ),  ),  ],   ),
              ),
               Padding(
                 padding:   EdgeInsets.only(left: 10.w),
                 child: Row(
                   children: [
                     Text("Account", style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold , color: GlobalVar.red,
                               ),
                               ),
                   ],
                 ),
               ),
               _buildTextFields("Email" , "johndoe@gmail.com" , Icon(Icons.email , color: GlobalVar.red,)),
               SizedBox(height: 25),
            _buildTextFields("Password" , "password" , Icon(Icons.lock_outline , color: GlobalVar.red,)),
            Padding(
              padding:   EdgeInsets.only(right: 11.w, top: 2),
              child: Align(alignment: Alignment.topRight, child: Text("Forgot Password ?", style: TextStyle(
                color: GlobalVar.red , fontWeight: FontWeight.w700,
              ),)),
            ),
            Padding(
              padding:   EdgeInsets.only(top: 15),
              child: Text("Login With", style: TextStyle(fontWeight: FontWeight.w600),),
            ), 
            Text.rich(
              TextSpan(
                text: "Don't have a account? " , style: TextStyle(
                  fontWeight: FontWeight.bold ,color: Colors.grey, 
                ), 
                children: [

                  TextSpan(
                    text:  "Register Now" , style: TextStyle(
                  fontWeight: FontWeight.bold ,color: GlobalVar.red, 
                ), 
                  )
                ]
              ), 
              
            ), 
           // Expanded(child: Container()), 
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                height: 60 ,
             
              decoration: BoxDecoration(
                 color: GlobalVar.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30) ,
                )
              ),
            child: InkWell(
              onTap: () {
  //                Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => const NewsFeed()
  //   ),
  // );
       googleSignIn.login();
              },
              child: Center(
                child: Text(
                  "Login", style: TextStyle(
                   color: Colors.white , 
                    fontWeight: FontWeight.w600, 
                  ),
                ),
              ),
            ),
              ),
            ), 
            ],
          ),
        );
  }



  Padding _buildTextFields(String label , String hintText , Icon icon) {
    return Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 10.w),
                 child: Column(
                   children: [
                     Align(
                      alignment: Alignment.topLeft,
                      child: Text(label, style: TextStyle(
                            fontWeight: FontWeight.bold , 
                                   ),)), 
                     TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                     
                        hintText: hintText,
                        suffixIcon: icon,
                        focusColor: Colors.grey,  
                    hoverColor: GlobalVar.red,

                      ),
                     ),
                   ],
                 ),
               );
  }
}


