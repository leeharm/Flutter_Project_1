import 'package:flutter/material.dart';
import 'package:new_project/configs/colors.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.all(8.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset("assets/jumia_logo.png", width: 200),

            /// FIRST NAME
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                children: [
                  Text(
                    "First Name",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  hint: Text("Enter First Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// SECOND NAME
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                children: [
                  Text(
                    "Second Name",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  hint: Text("Enter Second Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// EMAIL
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                children: [
                  Text(
                    "Enter Email",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  hint: Text("Email or Phone Number"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// PASSWORD
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                children: [
                  Text(
                    "Enter Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  hint: Text("Create Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// CONFIRM PASSWORD
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                children: [
                  Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  hint: Text("Re-enter Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// SIGNUP BUTTON
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),

              onTap: () {
                Get.offAndToNamed("/homescreen");
              },
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 30.0, 0),

              child: Row(
                children: [
                  Spacer(),

                  Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 18),
                  ),

                  GestureDetector(
                    child: Text(
                      "Login",
                      style: TextStyle(color: primaryColor, fontSize: 18),
                    ),

                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
