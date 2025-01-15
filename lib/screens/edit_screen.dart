import 'package:flutter/material.dart';



class EditScreenx extends StatefulWidget {
  const EditScreenx({super.key});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreenx> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: Center(child: const Text('Edit',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text('Name'),
            ),
            SizedBox(height: 5,),
            // Name TextField
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter  name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
             Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Text('Phone No.'),
            ),
             SizedBox(height: 5,),
            
            // Phone TextField
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: '+971509876543',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            
         
           Container(
                      height: 50,
                      width: 360,
                      child: Center(
                          child: TextButton(onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(),));
                          }, child: const Text('UPDATE ',style: TextStyle(color: Colors.white,fontSize: 15),))
                       
                    
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 7, 12, 151),
                      ))
          ],
        ),
      ),
    );
  }
}
