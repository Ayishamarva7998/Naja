import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:naja/widgets/card_widget.dart';

import 'package:naja/model/edit_model.dart';
import 'package:naja/model/profile_model.dart';
import 'package:naja/screens/edit_screen.dart';

import 'package:naja/screens/location_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  bool isLoading = true;

  late Dio dio;

  @override
  void initState() {
    super.initState();

    dio = Dio(BaseOptions(
      baseUrl: 'https://naja.qnltest.xyz/api/',
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM4NTc3MjkxLCJpYXQiOjE3MzY4NDkyOTEsImp0aSI6ImNhZjUwYzNjNjg1YjRiMzdhYzk4NjI3MzUzNWEwMThhIiwidXNlcl9pZCI6NTd9.anFHbEtPAPlcOIs_k-ebERcrgr7ezWN-NKgJRga_Lf4',
      },
    ));

    fetchDashboardItems();
  }

  Future<void> fetchDashboardItems() async {
    try {
      const endpoint = '/accounts/customer/user-profile';

      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        setState(() {
          user = User.fromJson(response.data['data']);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("Error fetching dashboard items: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(

              child: Column(
                  children: [
                    _buildHeader(),
                    _buildAdditionalContainer(),
                   SettingsWidget()
                 ,
                  ],
                ),
            ),
      ),
    );
  }

  Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 237, 237),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user != null ? 'Hi ${user!.name}' : 'Hi guest',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              IconButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreenx(),));

  },
  icon: Image.asset('assets/edit.png'),
),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Text(
              user?.email ?? 'Email not available',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Text(
              user?.phone ?? 'Phone not available',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ),
          
          
        ],
        
      ),
      
    ),
    
  );
  
}
Widget _buildAdditionalContainer() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child:
Container(
  height: 100,
  width: double.infinity,
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover),
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Column(
    children: [

      Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Row(
          children: [
            Image.asset('assets/coin.png', height: 25, width: 50),
            SizedBox(width: 8), 
            Text(
              'You\'ve earned: 80 points',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      
     
      Padding(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Text(
          '80/100 points (Next Claim: 20 points Needed)',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
      
     
      Padding(
        padding: const EdgeInsets.only(left: 200, top: 5),
        child: Text(
          'View Details',
          style: TextStyle(fontSize: 9, color: Colors.white),
        ),
      ),
    ],
  ),
)


  );
}
}