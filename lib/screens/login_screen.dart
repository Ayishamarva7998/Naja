import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _login(BuildContext context) async {
    String phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isNotEmpty) {
     
      String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM4ODE2NTgxLCJpYXQiOjE3MzcwODg1ODEsImp0aSI6IjVmYjM0ZmQzYTgxNzQ0NzhhNzhiYzFkNzU0N2M4ODNjIiwidXNlcl9pZCI6NTh9.8xgdpsNDWuh0WoavCNnmZ51cnl47gwo4GQ10XReEHt8_$phoneNumber';
      
    
      await _saveToken(token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'To get started, simply log in with your phone number',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 50.h,
                    width: 340.w,
                    child: TextField(
                      controller: _phoneController,
                      style: const TextStyle(fontSize: 12),
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Enter phone no.',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromARGB(255, 248, 246, 246),
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () => _login(context),
                    child: Container(
                      height: 45.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: const Color.fromARGB(255, 9, 22, 175),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: 16.h),
                  Center(child: Text('Search Nearby',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 13, 8, 180)),))
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
