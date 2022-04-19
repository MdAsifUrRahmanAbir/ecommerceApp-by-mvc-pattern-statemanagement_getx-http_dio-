import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_b102/views/home_screen.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    goHomeScreen(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [

          Center(
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/sports-logo-png-transparent.png'),
            ),
          ),

          const SizedBox(height: 1),

          Center(
            child: Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/img_223884.png'),
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: Container(
              height: 30,
              width: 30,
              child: const CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ],
      ),

    );
  }

  void goHomeScreen(BuildContext context) async {

    await Future.delayed(const Duration(seconds: 3));
    //Get.toNamed(HomeScreen.routeName);
    //Get.offAll(HomeScreen.routeName);
    Get.offNamedUntil(HomeScreen.routeName, (route) => false);

  }

}