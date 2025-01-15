import 'package:flutter/material.dart';



class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name TextField
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            
            // Phone TextField
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            // Save Button
            ElevatedButton(
              onPressed: () {
                // Print the entered values (or handle saving logic)
                print('Name: ${_nameController.text}');
                print('Phone: ${_phoneController.text}');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
