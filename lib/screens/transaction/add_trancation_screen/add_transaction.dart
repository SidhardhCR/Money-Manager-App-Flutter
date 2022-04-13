import 'package:flutter/material.dart';
import 'package:money_manager_app/db/catergory/category_dbfunction.dart';
import 'package:money_manager_app/model/category/category_dbmodel.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({ Key? key }) : super(key: key);

  static const routname ='add-transaction';

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selcetedCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Purpose'),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Amount'),),

                
              TextButton.icon(onPressed: ()async{
               final _selectedDateTemp = await showDatePicker(
            
                  context: context,
                  initialDate: DateTime.now(), 
                  firstDate: DateTime.now().subtract(const Duration(days: 30)), 
                  lastDate: DateTime.now(), 
                  );
                  if(_selectedDateTemp == null){
                    return;
                  }else{
                    setState(() {
                      _selectedDate = _selectedDateTemp;
                    });
                  }
                  
              }, icon: const Icon(Icons.calendar_today), 
              label: Text(_selectedDate == null? 'Select Date ': _selectedDate!.toString()),),
             
              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: CategoryType.income, 
                        groupValue: CategoryType.income, 
                        onChanged: (newValue){
                            
                      }),
                      Text('Income')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: CategoryType.expense, groupValue: CategoryType.income, onChanged: (newValue){

                      }),
                      Text('Expense')
                    ],
                  ),
                ],
              ),
              DropdownButton(
                hint: Text('Select Category'),
                items: CategoryDB.instance.incomeListNotifier.value.map((e){
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name));
              }).toList(), onChanged: (selectedValue){
                print(selectedValue);
              }),
              ElevatedButton(onPressed: (){

              }, 
              child: Text('Submit'))
            ],
          ),
        )
        ),
    );
  }
}