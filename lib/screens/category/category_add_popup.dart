import 'package:flutter/material.dart';
import 'package:money_manager_app/db/catergory/category_dbfunction.dart';
import 'package:money_manager_app/model/category/category_dbmodel.dart';

   ValueNotifier<CategoryType> selectedType = ValueNotifier(CategoryType.income);
   

Future<void> CategoryAddPopup(BuildContext context) async{
  TextEditingController _catogeryController = TextEditingController();
  showDialog(
    context: context, 
    builder: (ctx){
        return SimpleDialog(
          title: const Text('Add Category'),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Category'
              ),
              controller: _catogeryController ,
              
              ),
            ),

            Padding(padding: EdgeInsets.all(8.0,),
            child:Row(children: [
              RadioButton(title: 'Income', type: CategoryType.income),
              RadioButton(title: 'Expense', type: CategoryType.expense)
            ]) ,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){

                 final _name = _catogeryController.text;
                 if(_name.isEmpty){
                   return;
                 }
                 final _type = selectedType.value;
                

               final _category = CategoryModel(id: DateTime.now().millisecondsSinceEpoch.toString(), name: _name, type: _type)  ;

                    CategoryDB().insertCategory(_category);

                    CategoryDB().refreshUI();

                    Navigator.of(ctx).pop();
                    
              }, child: const Text('Add')),
            ),
          ],
        );
    },);
}

class RadioButton extends StatelessWidget {
  final CategoryType type;
  final String title;
  const RadioButton({ Key? key , required this.title, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ValueListenableBuilder(
        valueListenable: selectedType,
        builder: (BuildContext ctx, CategoryType newCategory, Widget? _){
              return  Radio<CategoryType>(
          value: type, 
          groupValue: newCategory, 
          onChanged: (values){
              if(values == null){
                return;
              }
              selectedType.value = values;
          }
          
          );
        },
       
      ),
        Text(title),
        ],
        
    );
  }
}