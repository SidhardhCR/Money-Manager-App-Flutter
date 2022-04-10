import 'package:flutter/material.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({ Key? key }) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  
  @override
  void initState() {
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
            Tab(text: 'EXPENCE',)
          ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
              Text('Income List '),
              Text('Expence List'),
            ]),
          )
        ],
      );
    
  }
}