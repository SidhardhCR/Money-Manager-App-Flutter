import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/category/screen_category.dart';
import 'package:money_manager_app/screens/transaction/screen_transaction.dart';

import 'widgets/bottom_navigationbar.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({ Key? key }) : super(key: key);

  static ValueNotifier<int> selectedIndex = ValueNotifier(0);

  final _page = [
      ScreenTransaction(),
      ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(child: ValueListenableBuilder(
        valueListenable:selectedIndex ,
        builder: (BuildContext ctx, int updatedIndex, Widget? _){
              return _page[updatedIndex];
        },
        )),
      bottomNavigationBar: MoneyManagerBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
            if(selectedIndex.value==0){
                print('transaction added');
            }
            else{
              print('category added');
            }
      },
      child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Money Manager',),centerTitle: true,),
         
    );
  }
}