
 
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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: false,
        title: 
        const Text.rich(TextSpan(
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
             height: 5.5.h,   decoration: BoxDecoration(  color: Colors.white,   border: Border.all(
                color: GlobalVar.red,
              ), 
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child:
             Row(
              children: [ 
                 Container( width: 51.5.w,   
                 decoration: isLoginPage ?  BoxDecoration(  color: GlobalVar.red,  border: Border.all(
                color: GlobalVar.red,
              ), 
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ) : 
            const BoxDecoration(  
              color: Colors.white,  
             borderRadius: 
             BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), ),
            child: InkWell(
              onTap: () {
                setState(() {
                  isLoginPage = true;
                });
              },
              child: const Center(child: 
              Text(   "LOGIN", style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w800), )),
            ),
             ), 

            Container(   width: 47.5.w,   
            decoration:  !isLoginPage ?  BoxDecoration(  color: GlobalVar.red,  border: Border.all(
                color: GlobalVar.red,
              ), 
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ) : 
            const BoxDecoration(  
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
               child: const Center(child: Text(   "SIGN UP",
                style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w800), )),
             ),
            
              ), 
              ],
            ),
          ),  

          // =============

          SizedBox(child: isLoginPage ? const LoginScreen() : const SignUpScreen()), 
        ],
      ),
    );
  }
}