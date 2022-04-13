import 'package:flutter/material.dart';
import 'package:money_manager_app/db/catergory/category_dbfunction.dart';
import 'package:money_manager_app/screens/category/expense_category_list.dart';
import 'package:money_manager_app/screens/category/income_category_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({ Key? key }) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  
  @override
  void initState() {
     CategoryDB().refreshUI();
    _tabController = TabController(length: 2, vsync: this);
  }

  
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            controller: _tabController,
            tabs: [
            Tab(text: 'INCOME',),
            Tab(text: 'EXPENSE',)
          ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
              IncomeCategoryList(),
              ExpenseCategoryList(),
            ]),
          )
        ],
      );
    
  }
}