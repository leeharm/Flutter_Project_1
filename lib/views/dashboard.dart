import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../configs/colors.dart';
import '../controllers/logincontroller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List jerseys = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJerseys();
  }

  fetchJerseys() async {
    try {
      var response = await http.get(
        Uri.parse("http://127.0.0.1/jersey/get_jerseys.php"),
      );

      if (response.statusCode == 200) {
        setState(() {
          jerseys = json.decode(response.body);
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  String get userName {
    final loginController = Get.find<LoginController>();
    final email = loginController.email.value;
    if (email.isEmpty) return '';

    final localPart = email.split('@').first;
    final nameParts = localPart.split(RegExp(r'[._\-]'));
    return nameParts
        .map(
          (part) => part.isEmpty
              ? part
              : '${part[0].toUpperCase()}${part.substring(1)}',
        )
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,

      appBar: AppBar(
        backgroundColor: lightColor,
        elevation: 0,
        centerTitle: true,
        title: Image.asset("assets/logo.png", height: 40),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final name = userName;
              return Text(
                name.isEmpty ? 'Welcome 👋' : 'Welcome, $name 👋',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: darkColor,
                ),
              );
            }),

            const SizedBox(height: 5),

            const Text(
              "Shop premium jerseys",
              style: TextStyle(color: greyColor),
            ),

            const SizedBox(height: 25),

            // Jerseys Section
            const Text(
              "Jerseys",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkColor,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: List.generate(jerseys.length, (index) {
                        var item = jerseys[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    "http://127.0.0.1/jersey/jersey_images/${item['image']}",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey.shade200,
                                        child: const Icon(
                                          Icons.image,
                                          size: 30,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  item['team'] ?? "No name",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
