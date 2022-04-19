import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project_b102/utils/di.dart';
import 'package:project_b102/views/splash_screen.dart';

import 'views/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,

      builder: EasyLoading.init(),
      initialBinding: MyDi(),
      smartManagement: SmartManagement.full,

      getPages: [
        GetPage(name: '/', page: ()=> SplashScreen()),
        GetPage(name: HomeScreen.routeName, page: ()=> HomeScreen()),
      ],
    );
  }
}




/// state management      need first mvc, mvp, mvvm
///   1. provider                       2
///   2. mobx
///   3. flutter block    advance
///   4. get              easiest state management 1