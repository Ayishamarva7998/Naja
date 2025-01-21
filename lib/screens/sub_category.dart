import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new),
      actions: [Icon(Icons.search)],
      title: 
      Padding(
        padding: const EdgeInsets.all(32),
        child: Text('Meat , Chicken & Fish',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
      ),),

      body: Row(children: [
        Column(children: [
          Container(height: 220,
          width: 190,
          child: Column(children: [Text('hhhhh',style: TextStyle(color: Colors.black),)],),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.amber,image: DecorationImage(image: AssetImage('assets/nyxcream.jpg'))),
          ),
          
          
        ],),
        SizedBox(width: 10,),
        Column(children: [
           Container(height: 220,
          width: 190,
          color: Colors.amber,)
        ],)
      ],),
    );
  }
}