import 'package:flutter/material.dart';

import '../../db/catergory/category_dbfunction.dart';
import '../../model/category/category_dbmodel.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().expenseListNotifier,
        builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
          if (CategoryDB.instance.expenseListNotifier.value.isEmpty) {
            return Center(
                child: Text('Add some category',
                    style: TextStyle(color: Colors.grey)));
          }
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final _category = newList[index];
              return Card(
                margin: EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(_category.name),
                  trailing: IconButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(_category.id);
                      },
                      icon: Icon(Icons.delete, color: Colors.red)),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: newList.length,
          );
        });
  }
}
