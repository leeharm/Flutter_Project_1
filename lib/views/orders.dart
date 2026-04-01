import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controllers/logincontroller.dart';

//  CREATE CONTROLLER INSTANCE
LoginController loginController = Get.find();

class Order extends StatelessWidget {
  const Order({super.key});

  Future placeOrder(item) async {
    try {
      var response = await http.post(
        Uri.parse("http://127.0.0.1/order.php"),
        body: {
          "user_id": loginController.userId.value.toString(),
          "jersey_id": item['id'].toString(),
          "quantity": "1",
          "total_price": item['price'].toString(),
        },
      );

      if (response.body == "success") {
        Get.snackbar("Success", "Order placed successfully");
      } else {
        Get.snackbar("Error", "Order failed");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Orders"), centerTitle: true),

      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Arsenal Jersey"),
            subtitle: Text("Quantity: 1"),
            trailing: Text("Ksh 3500"),
            onTap: () {
              // TEST ORDER BUTTON
              placeOrder({"id": 1, "price": 3500});
            },
          ),
        ],
      ),
    );
  }
}
