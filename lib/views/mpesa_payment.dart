import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:new_project/configs/colors.dart';
import '../controllers/logincontroller.dart';

class MpesaPaymentPage extends StatefulWidget {
  final Map item;
  const MpesaPaymentPage({super.key, required this.item});

  @override
  State<MpesaPaymentPage> createState() => _MpesaPaymentPageState();
}

class _MpesaPaymentPageState extends State<MpesaPaymentPage> {
  final TextEditingController phoneController = TextEditingController();
  final LoginController loginController = Get.find();
  bool isLoading = false;

  Future<void> placeOrder() async {
    if (phoneController.text.trim().isEmpty) {
      Get.snackbar('Phone required', 'Please enter your MPESA phone number');
      return;
    }

    final phoneNumber = phoneController.text.trim();
    final item = widget.item;

    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse('http://127.0.0.1/order.php'),
        body: {
          'user_id': loginController.userId.value.toString(),
          'jersey_id': item['id'].toString(),
          'quantity': '1',
          'total_price': item['price'].toString(),
          'payment_method': 'MPESA',
          'phone_number': phoneNumber,
        },
      );

      if (response.statusCode == 200 && response.body == 'success') {
        Get.snackbar('Success', 'Payment prompt sent to $phoneNumber');
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.back();
        });
      } else {
        Get.snackbar(
          'Payment failed',
          'Could not place order. Please try again.',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Unable to connect to the server.');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('M-PESA Payment'),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['team'] ?? 'Selected Jersey',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Amount: Ksh ${item['price']}',
              style: const TextStyle(fontSize: 18, color: primaryColor),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: darkColor.withOpacity(0.06),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.payment, color: primaryColor),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Payment option: M-PESA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Enter phone number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'e.g. 0712345678',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You will receive an M-PESA prompt on this phone number after you confirm.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: isLoading ? null : placeOrder,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Send MPESA Prompt',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
