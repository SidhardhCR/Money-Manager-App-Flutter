import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/home/screen_home.dart';

class MoneyManagerBottomNavigationBar extends StatelessWidget {
  const MoneyManagerBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndex,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.yellowAccent.shade700,
          onTap: (newIndex) {
            ScreenHome.selectedIndex.value = newIndex;
          },
          currentIndex: updatedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category')
          ],
        );
      },
    );
  }
}
