
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

 import 'package:flutter/material.dart';
 import 'package:news_app/constants.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/screens/signup_screen.dart';
 import 'package:sizer/sizer.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

 bool isLoginPage = true;
class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: 
        Text.rich(TextSpan(
          text: "Social",
          style: TextStyle(color: Colors.white, ),
          children: [
            TextSpan(
              text: "X", 
            style: TextStyle(color: Colors.white,
             fontWeight: FontWeight.w400, fontSize: 35),
            ), 
          ]
        )),
        backgroundColor: GlobalVar.red, 
      ),
      body: Column(
        children: [
          // == login sign up buttons 
          Container(  
             height: 45,   decoration: BoxDecoration(  color: Colors.white,   border: Border.all(
                color: GlobalVar.red,
              ), 
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child:
             Row(
              children: [ 
                 Container( width: 51.5.w,   
                 decoration: isLoginPage ?  BoxDecoration(  color: GlobalVar.red,  border: Border.all(
                color: GlobalVar.red,
              ), 
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ) : 
            BoxDecoration(  
              color: Colors.white,  
             borderRadius: 
             BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), ),
            child: InkWell(
              onTap: () {
                setState(() {
                  isLoginPage = true;
                });
              },
              child: Center(child: 
              Text(   "LOGIN", style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w800), )),
            ),
             ), 

            Container(   width: 47.5.w,   
            decoration:  !isLoginPage ?  BoxDecoration(  color: GlobalVar.red,  border: Border.all(
                color: GlobalVar.red,
              ), 
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ) : 
            BoxDecoration(  
              color: Colors.white,  
             borderRadius: 
           
             BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), ),   
             child: 
             InkWell(
              onTap: () {
                setState(() {
                  isLoginPage = false;
                });
              },
               child: Center(child: Text(   "SIGN UP",
                style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w800), )),
             ),
            
              ), 
              ],
            ),
          ),  

          // =============

          isLoginPage ? LoginScreen() : SignUpScreen(), 
        ],
      ),
    );
  }
}