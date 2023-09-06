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
    return Container(
      width: 100.w,
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
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
              "Contact no", "9867238754", const Icon(Icons.phone)),
          const SizedBox(height: 25),
          _buildTextFields(
              "Password",
              "password",
              Icon(
                Icons.lock_outline,
                color: GlobalVar.red,
              )),

          CheckboxListTile(
              //checkbox positioned at right
              value: false,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {},
              // activeColor: Colors.green,
              title: Text.rich(
                TextSpan(
                    text: "I agree with ",
                    style: TextStyle(
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
                    text: "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: GlobalVar.red,
                    ),
                  )
                ]),
          ),
          // Expanded(child: Container()),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: GlobalVar.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
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
          children: [
            Icon(Icons.flag),
            //  Text("IN +91"),
            // DropdownButton<String>(
            //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   onChanged: (_) {},
            // ),
            DropdownButton<String>(
              hint: const Text('91'),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )
          ],
        ),
        // TextField(
        //  decoration: InputDecoration(
        //    hoverColor: GlobalVar.red,
        //    border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
        //    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2,),),
        //    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
        //    hintText: hintText,
        //    suffixIcon: icon,
        //    focusColor: Colors.grey,

        //  ),
        // ),
      ],
    ),
  );
}
