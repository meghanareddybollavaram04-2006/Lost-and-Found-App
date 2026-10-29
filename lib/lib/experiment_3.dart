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
        title: const Text("Experiment 3 - Layouts"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Row and Column Layout",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                  child: const Icon(Icons.home, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.orange,
                  child: const Icon(Icons.settings, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Widgets arranged using Row and Column"),
          ],
        ),
      ),
    );
  }
}
