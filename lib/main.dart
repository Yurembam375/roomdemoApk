import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomdemo/screen/dashboard.dart';
import 'package:roomdemo/screen/leadDetailsScreen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
     const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
          home: DashboardPage(),
          getPages: [
            GetPage(name: '/leadDetails', page: () => LeadsDetailScreen()),
          ],
    );
  }
}

