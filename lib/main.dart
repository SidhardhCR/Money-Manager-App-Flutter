import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager_app/db/catergory/category_dbfunction.dart';
import 'package:money_manager_app/db/transaction/transaction_db_functions.dart';
import 'package:money_manager_app/screens/home/screen_home.dart';
import 'package:money_manager_app/screens/transaction/add_trancation_screen/add_transaction.dart';

import 'model/category/category_dbmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  categoryModelAdapterRegister();
  categoryTypeAdapterRegister();
  transactionModelAdapterRegister();

  Categoryinit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 300,
          splash: Image(
            image: AssetImage('lib/asset/logo2-removebg-preview.png'),
            width: 500,
            height: 500,
          ),
          backgroundColor: Colors.yellow,
          duration: 1500,
          nextScreen: ScreenHome()),
      routes: {AddTransactionScreen.routname: (ctx) => AddTransactionScreen()},
    );
  }
}

Future<void> Categoryinit() async {
  final _categoryDB1 = await Hive.openBox<CategoryModel>(CategoryDB_Name);
  if (_categoryDB1.values.isEmpty) {
    final _category2 = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Salary',
        type: CategoryType.income);
    CategoryDB().insertCategory(_category2);

    final _category3 = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Travel',
        type: CategoryType.expense);
    CategoryDB().insertCategory(_category3);

    CategoryDB().refreshUI();
  }
}
