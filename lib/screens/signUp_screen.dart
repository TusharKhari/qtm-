// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _signUpDetails(),
        _signUpButton()
      ],
    );
  }

  Padding _signUpDetails() {
    return Padding(
      padding:   EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
         width: 100.w, 
         decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(35))
            ),
        child: 
        Column(
           children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8),
              child: Row(
                children: [
                  Text(
                    "Create an ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: GlobalVar.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: GlobalVar.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            _buildTextFields(
                "Name",
                "john doe",
                Icon(
                  Icons.person,
                  color: GlobalVar.red,
                )),
            const SizedBox(height: 25),
            _buildTextFields(
                "Email",
                "johndoe@gmail.com",
                Icon(
                  Icons.email,
                  color: GlobalVar.red,
                )),
            const SizedBox(height: 25),
            _buildTextFieldsPNo(
                "Contact no", "9867238754",   Icon(Icons.phone , color: GlobalVar.red, size: 30,)),
            const SizedBox(height: 25),
            _buildTextFields(
                "Password",
                "*********",
                Icon(
                  Icons.lock_outline,
                  color: GlobalVar.red,
                )),
        SizedBox(height: 1.h,),
            CheckboxListTile( 
                value: false,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {},
                // activeColor: Colors.green,
                title: Text.rich(
                  TextSpan(
                      text: "I agree with ",
                      style: const TextStyle(
                          // color: Colors.grey,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: "terms & conditions",
                          style: TextStyle(
                              color: GlobalVar.red,
                              decoration: TextDecoration.underline,
                              decorationColor: GlobalVar.red,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                )),
        
            Text.rich(
              TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign In!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: GlobalVar.red,
                      ),
                    )
                  ]),
            ),
             SizedBox(height: 11.h,)
          ],
        ),
      ),
    );
  }

  Container _signUpButton() {
    return Container(
        height: 60,
        decoration: BoxDecoration(
            color: GlobalVar.red,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: const Center(
          child: Text(
            "REGISTER",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
  }

  Padding _buildTextFields(String label, String hintText, Icon icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
          TextField(
            decoration: InputDecoration(
              hoverColor: GlobalVar.red,
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2)),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2)),
              hintText: hintText,
              suffixIcon: icon,
              focusColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

Padding _buildTextFieldsPNo(String label, String hintText, Icon icon) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          const Icon(Icons.flag), 
            const Text("IN +91", style: TextStyle(
              fontWeight: FontWeight.w600, 
              fontSize: 18, 
            ),),
            const Icon(Icons.arrow_drop_down),   
            SizedBox(
              height: 35,
              width: 160,
              child:   TextField(
         decoration: InputDecoration(
           hoverColor: GlobalVar.red,
           border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
           focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2,),),
           enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
           hintText: hintText,
           suffixIcon: icon,
           iconColor: GlobalVar.red,
           focusColor: Colors.grey, 
           ),
        ),
            ), 
          ],
        ), 
      ],
    ),
  );
}
