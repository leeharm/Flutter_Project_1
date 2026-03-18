import 'package:flutter/material.dart';
import 'package:new_project/configs/colors.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Widget buildTextField(String label, String hint, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),

        const SizedBox(height: 6),

        TextField(
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                /// LOGO
                Center(child: Image.asset("assets/logo.png", width: 200)),

                const SizedBox(height: 40),

                /// FIRST NAME
                buildTextField("First Name", "Enter First Name", Icons.person),

                /// SECOND NAME
                buildTextField(
                  "Second Name",
                  "Enter Second Name",
                  Icons.person_outline,
                ),

                /// EMAIL
                buildTextField(
                  "Enter Email",
                  "Email or Phone Number",
                  Icons.email,
                ),

                /// PASSWORD
                buildTextField("Enter Password", "Create Password", Icons.lock),

                /// CONFIRM PASSWORD
                buildTextField(
                  "Confirm Password",
                  "Re-enter Password",
                  Icons.lock_outline,
                ),

                /// SIGNUP BUTTON
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed("/homescreen");
                  },

                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// LOGIN LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },

                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
