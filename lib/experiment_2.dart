
import 'package:flutter/material.dart';

void main() {
  runApp(const Experiment2App());
}

class Experiment2App extends StatelessWidget {
  const Experiment2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Experiment 2 - Basic Widgets'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Flutter Basic Widgets',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

              const Icon(
                Icons.favorite,
                size: 60,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {},
                child: const Text('Click Me'),
              ),

              const SizedBox(height: 20),

              const Text(
                'Text, Icon and Button Widgets',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
