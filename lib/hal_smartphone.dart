import 'package:flutter/material.dart';

class Smartphone extends StatelessWidget {
  const Smartphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 221, 221, 228),
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset(
              'assets/img/mewing.jpg', // Replace with your image path
              width: 300, // Set the width as needed
              height: 300, // Set the height as needed
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            const Text(
              'This is a sample image.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}