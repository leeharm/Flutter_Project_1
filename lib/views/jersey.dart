import 'package:flutter/material.dart';

class Jersey extends StatelessWidget {
  const Jersey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Jerseys")),

      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        children: [
          jerseyCard("JVC Jersey", "assets/jvc.png", "Ksh 3500"),
          jerseyCard("Barcelona Jersey", "assets/ww.png", "Ksh 4000"),
          jerseyCard("Rugby Jersey", "assets/rugby_1.png", "Ksh 3500"),
          jerseyCard("Rugby Jersey", "assets/rugby_2.png", "Ksh 3800"),
        ],
      ),
    );
  }

  Widget jerseyCard(String name, String image, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),

      child: Column(
        children: [
          Expanded(child: Image.asset(image, fit: BoxFit.cover)),

          const SizedBox(height: 5),

          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text(
            price,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
