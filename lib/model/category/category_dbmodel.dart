import 'package:hive_flutter/hive_flutter.dart';
part 'category_dbmodel.g.dart';

@HiveType(typeId: 2)
enum CategoryType{
  @HiveField(0)
    income,
    @HiveField(1)
    expense

}



@HiveType(typeId: 1)
class CategoryModel{
      @HiveField(0)
      final String id;
      @HiveField(1)
      final String name;
      @HiveField(3)
      final bool isDeleted;
      @HiveField(2)
      final CategoryType type;

  CategoryModel({required this.id,required this.name, this.isDeleted = false,required this.type});

}