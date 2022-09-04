import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager_app/db/transaction/transaction_db_functions.dart';
import 'package:money_manager_app/model/category/category_dbmodel.dart';

import '../../db/catergory/category_dbfunction.dart';
import '../../model/Transaction/transaction_db_model.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUI();
    CategoryDB().refreshUI();

    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newlist, Widget? _) {
        return ListView.separated(
            padding: EdgeInsets.all(5),
            itemBuilder: (ctx, index) {
              final _value = newlist[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(parsedDate(_value.date)),
                    radius: 50,
                    backgroundColor: _value.type == CategoryType.income
                        ? Colors.green
                        : Colors.red,
                  ),
                  title: Text('Rs ${_value.amount}'),
                  subtitle: Text(_value.category.name),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: newlist.length);
      },
    );
  }

  String parsedDate(date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitdate = _date.split(' ');
    return '${_splitdate.first}\n${_splitdate.last}';
  }
}
