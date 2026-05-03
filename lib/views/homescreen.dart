import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../configs/colors.dart';
import 'dashboard.dart';
import 'orders.dart';
import 'profile.dart';
import 'jersey.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = [const Dashboard(), const Jersey(), const Order(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: lightColor.withOpacity(0.98),
      body: screens[index],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: darkColor.withOpacity(0.95),
        buttonBackgroundColor: primaryColor,
        height: 52,
        animationDuration: const Duration(milliseconds: 280),

        items: const [
          Icon(Icons.dashboard, size: 24, color: lightColor),
          Icon(Icons.sports_soccer, size: 24, color: lightColor),
          Icon(Icons.shopping_cart, size: 24, color: lightColor),
          Icon(Icons.person, size: 24, color: lightColor),
        ],

        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
