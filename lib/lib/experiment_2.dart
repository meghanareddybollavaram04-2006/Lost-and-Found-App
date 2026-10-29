import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPage(),
  ));
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Experiment 2"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 70, color: Colors.blue),
            SizedBox(height: 15),
            Text(
              "Welcome to Flutter!",
              style: TextStyle(fontSize: 24),
            ),
            Text("My first widget experiment"),
          ],
        ),
      ),
    );
  }
}
