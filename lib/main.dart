import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portofolio Flutter',
      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}
