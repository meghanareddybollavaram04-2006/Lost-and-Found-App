
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('GridView Example')),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(child: Center(child: Text('Apple'))),
          Card(child: Center(child: Text('Banana'))),
          Card(child: Center(child: Text('Mango'))),
          Card(child: Center(child: Text('Orange'))),
          Card(child: Center(child: Text('Grapes'))),
          Card(child: Center(child: Text('Pineapple'))),
        ],
      ),
    ),
  ));
}

