import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../controllers/logincontroller.dart';

class Jersey extends StatefulWidget {
  const Jersey({super.key});

  @override
  State<Jersey> createState() => _JerseyState();
}

class _JerseyState extends State<Jersey> {
  //  Get logged-in user
  final LoginController loginController = Get.find();

  List jerseys = [];

  @override
  void initState() {
    super.initState();
    fetchJerseys();
  }

  /// FETCH JERSEYS FROM DATABASE
  fetchJerseys() async {
    try {
      var response = await http.get(
        Uri.parse("http://localhost/jersey/get_jerseys.php"),
      );

      if (response.statusCode == 200) {
        setState(() {
          jerseys = json.decode(response.body);
        });
      } else {
        print("Failed to load jerseys");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  /// PLACE ORDER
  Future placeOrder(item) async {
    try {
      print("USER ID: ${loginController.userId.value}");

      var response = await http.post(
        Uri.parse("http://localhost/order.php"),
        body: {
          "user_id": loginController.userId.value.toString(),
          "jersey_id": item['id'].toString(),
          "quantity": "1",
          "total_price": item['price'].toString(),
        },
      );

      print(response.body);

      if (response.body == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Order placed successfully")),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Order failed")));
      }
    } catch (e) {
      print("Error placing order: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Server error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jerseys"), centerTitle: true),

      body: jerseys.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jerseys.length,
              itemBuilder: (context, index) {
                var item = jerseys[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      "http://localhost/jersey/jersey_images/${item['image']}",
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                    ),

                    title: Text(item['team'] ?? "No name"),
                    subtitle: Text("Ksh ${item['price'] ?? '0'}"),

                    trailing: ElevatedButton(
                      child: const Text("Buy"),
                      onPressed: () {
                        placeOrder(item);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
