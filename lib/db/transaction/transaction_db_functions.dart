
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager_app/model/Transaction/transaction_db_model.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDBFunction{
    Future<void> addTransaction(TransactionModel values);
    Future<List<TransactionModel>> getTransaction();
}

class TransactionDB implements TransactionDBFunction{

  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB(){
    return instance;
  }
  @override
  Future<void> addTransaction(TransactionModel values) async {
      final _transactionDb = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
     await _transactionDb.put(values.id ,values);
  }

  @override
  Future<List<TransactionModel>> getTransaction()async {
    final _transactionDb = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _transactionDb.values.toList();
  }
  





  
}
Future<void> transactionModelAdapterRegister()async{
    if(!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)){
      Hive.registerAdapter(TransactionModelAdapter());
    }
  }