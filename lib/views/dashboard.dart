import 'package:flutter/material.dart';
import 'jersey.dart';
import 'orders.dart';
import 'profile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset("assets/logo.png", height: 40),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// 🔥 WELCOME TEXT
            const Text(
              "Welcome 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "Browse and shop your favorite jerseys",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            /// 🔥 GRID
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                children: [
                  dashboardCard(
                    context,
                    "Jerseys",
                    Icons.sports_soccer,
                    Colors.orange,
                    const Jersey(),
                  ),

                  dashboardCard(
                    context,
                    "Orders",
                    Icons.shopping_cart,
                    Colors.green,
                    const Order(),
                  ),

                  dashboardCard(
                    context,
                    "Profile",
                    Icons.person,
                    Colors.blue,
                    Profile(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ICON CONTAINER
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
