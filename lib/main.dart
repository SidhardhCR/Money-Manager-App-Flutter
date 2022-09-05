import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager_app/db/catergory/category_dbfunction.dart';
import 'package:money_manager_app/db/transaction/transaction_db_functions.dart';
import 'package:money_manager_app/screens/home/screen_home.dart';
import 'package:money_manager_app/screens/transaction/add_trancation_screen/add_transaction.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  categoryModelAdapterRegister();
  categoryTypeAdapterRegister();
  transactionModelAdapterRegister();
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
          splash: Icons.security_rounded,
          backgroundColor: Colors.yellow,
          duration: 1500,
          nextScreen: ScreenHome()),
      routes: {AddTransactionScreen.routname: (ctx) => AddTransactionScreen()},
    );
  }
}
