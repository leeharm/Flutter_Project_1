import 'package:new_project/views/homescreen.dart';
import 'package:new_project/views/login.dart';
import 'package:new_project/views/signup.dart';
import 'package:get/get.dart';

var routes = [
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignupScreen()),
  GetPage(name: "/homescreen", page: () => HomeScreen()),
];
