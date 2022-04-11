import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager_app/model/category/category_dbmodel.dart';

const CategoryDB_Name = 'categaory_db';

abstract class CategoryDBFunction{
    Future<List<CategoryModel>> getCategory();

    Future<void>  insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDBFunction{
  @override
  Future<void>  insertCategory(CategoryModel value)async{
       final _categoryDB = await Hive.openBox<CategoryModel>(CategoryDB_Name);

       await _categoryDB.add(value);
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CategoryDB_Name);

          return _categoryDB.values.toList();
  }

 
}

Future<void> categoryModelAdapterRegister() async{
        if(!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)){
              Hive.registerAdapter(CategoryModelAdapter());
        }
}

Future<void> categoryTypeAdapterRegister() async{
        if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)){
              Hive.registerAdapter(CategoryTypeAdapter());
        }
}