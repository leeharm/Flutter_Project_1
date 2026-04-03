import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../controllers/logincontroller.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final LoginController loginController = Get.find();

  List orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  /// FETCH USER ORDERS
  fetchOrders() async {
    try {
      print("Fetching orders for user: ${loginController.userId.value}");

      var response = await http.get(
        Uri.parse(
          "http://localhost/get_orders.php?user_id=${loginController.userId.value}",
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          orders = json.decode(response.body);
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders"), centerTitle: true),

      body: orders.isEmpty
          ? const Center(child: Text("No orders yet"))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                var item = orders[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag),

                    title: Text(item['team'] ?? "Unknown Jersey"),

                    subtitle: Text("Quantity: ${item['quantity']}"),

                    trailing: Text("Ksh ${item['total_price']}"),
                  ),
                );
              },
            ),
    );
  }
}
