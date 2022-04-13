import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager_app/model/category/category_dbmodel.dart';

const CategoryDB_Name = 'categaory_db';



abstract class CategoryDBFunction{
    Future<List<CategoryModel>> getCategory();

    Future<void>  insertCategory(CategoryModel value);

    Future<void> deleteCategory(String CategoryID);
}

class CategoryDB implements CategoryDBFunction{

  ValueNotifier<List<CategoryModel>> incomeListNotifier = ValueNotifier([]);
   ValueNotifier<List<CategoryModel>> expenseListNotifier = ValueNotifier([]);

    CategoryDB.internal();

    static CategoryDB instance = CategoryDB.internal();

    factory CategoryDB(){
        return instance;
    }
  
  
  @override
  Future<void>  insertCategory(CategoryModel value)async{
       final _categoryDB = await Hive.openBox<CategoryModel>(CategoryDB_Name);
         
        

       await _categoryDB.put(value.id,value);
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CategoryDB_Name);

          return _categoryDB.values.toList();
  }

    Future<void> refreshUI()async{
      final _allCategory = await getCategory();
      incomeListNotifier.value.clear();
      expenseListNotifier.value.clear();
     await Future.forEach(_allCategory, (CategoryModel category){

            if(category.type == CategoryType.income){
                    incomeListNotifier.value.add(category);
            }
            else{expenseListNotifier.value.add(category);}
      });
      incomeListNotifier.notifyListeners();
      expenseListNotifier.notifyListeners();
    }

  @override
  Future<void> deleteCategory(String CategoryID)async{
      final _categoryDB = await Hive.openBox<CategoryModel>(CategoryDB_Name);
      _categoryDB.delete(CategoryID);
      refreshUI();

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

