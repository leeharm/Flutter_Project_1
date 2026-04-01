import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/logincontroller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),

      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 100),

              SizedBox(height: 20),

              Text(
                "User ID: ${loginController.userId.value}",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 10),

              Text(
                "Email: ${loginController.email.value}",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed("/login");
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
