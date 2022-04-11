enum CategoryType{
    income,
    expense

}


class CategoryModel{
      final String name;
      final bool isDeleted;
      final CategoryType type;

  CategoryModel({required this.name, this.isDeleted = false,required this.type});

}