import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Jersey extends StatefulWidget {
  const Jersey({super.key});

  @override
  State<Jersey> createState() => _JerseyState();
}

class _JerseyState extends State<Jersey> {
  Future placeOrder(item) async {
    var response = await http.post(
      Uri.parse("http://127.0.0.1/order.php"),
      body: {
        "user_email": "test@gmail.com", // we improve this next
        "jersey_name": item['name'],
        "price": item['price'],
      },
    );

    if (response.body == "success") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Order placed successfully")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Order failed")));
    }
  }

  List jerseys = [];

  @override
  void initState() {
    super.initState();
    fetchJerseys();
  }

  /// FETCH DATA FROM API
  fetchJerseys() async {
    var response = await http.get(
      Uri.parse("http://127.0.0.1/jersey/get_jerseys.php"),
    );

    if (response.statusCode == 200) {
      setState(() {
        jerseys = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jerseys")),

      body: jerseys.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jerseys.length,
              itemBuilder: (context, index) {
                var item = jerseys[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      "http://127.0.0.1/jersey/jersey_images/${item['image']}",
                      width: 50,
                      height: 50,
                    ),

                    title: Text(item['team']),
                    subtitle: Text("Ksh ${item['price']}"),

                    trailing: ElevatedButton(
                      child: Text("Buy"),
                      onPressed: () {
                        // we will connect this next (orders)
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
