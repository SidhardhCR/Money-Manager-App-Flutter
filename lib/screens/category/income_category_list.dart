import 'package:flutter/material.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({ Key? key }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx,index){
        return ListTile(
          title: Text('Income Category $index'),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
        );
      },
      separatorBuilder: (ctx,index){
        return SizedBox(height: 10,);
      },
      itemCount: 20,
      
    );
  }
}