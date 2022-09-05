import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager_app/model/Transaction/transaction_db_model.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDBFunction {
  Future<void> addTransaction(TransactionModel values);
  Future<List<TransactionModel>> getTransaction();
  Future<void> deletTransaction(String id);
}

class TransactionDB implements TransactionDBFunction {
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionNotifier = ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel values) async {
    final _transactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _transactionDb.put(values.id, values);
  }

  Future<void> refreshUI() async {
    final _list = await getTransaction();
    _list.sort(
      (first, second) => second.date.compareTo(first.date),
    );
    transactionNotifier.value.clear();
    transactionNotifier.value.addAll(_list);
    transactionNotifier.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getTransaction() async {
    final _transactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _transactionDb.values.toList();
  }

  @override
  Future<void> deletTransaction(String id) async {
    final _transactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    _transactionDb.delete(id);
    refreshUI();
  }
}

Future<void> transactionModelAdapterRegister() async {
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
}
