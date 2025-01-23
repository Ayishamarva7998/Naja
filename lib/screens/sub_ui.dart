import 'package:flutter/material.dart';

class Subcategories extends StatelessWidget {
  const Subcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: IconButton(onPressed: (){}, icon: Image.asset('assets/arrowback.png',height: 20,)),
    actions: [Image.asset('assets/search (1).png',height: 30,)],
      title: const Text('Meat chicken & Fish',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),),
      body: Row(children: [
         SizedBox(width: 10,),
        Text('All',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
        SizedBox(width: 10,),
         Text('Beef',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          SizedBox(width: 10,),
          Text('Chicken',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
           SizedBox(width: 10,),
           Text('Lamb',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            SizedBox(width: 10,),
            Text('Turkey',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
             SizedBox(width: 10,),
             Text('Processed Meat',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
      ],
      ),
      
      );
  }
}