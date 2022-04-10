import 'package:flutter/material.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(5),
      itemBuilder: (ctx,index){
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('April \n 10'),radius: 50,),
            title: Text('1000'),
            subtitle: Text('Travel'),
          ),
        );
      }, 
      separatorBuilder: (ctx,index){
        return SizedBox(height: 10,);
      }, 
      itemCount: 10);
  }
}