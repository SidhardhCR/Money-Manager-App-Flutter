import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'transaction'),
        BottomNavigationBarItem(icon: Icon(Icons.category)),
         ]),
    );
  }
}