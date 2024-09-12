import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To My Portofolio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('/about'),
              child: Text('About Me'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/karya'),
              child: Text('Karya'),
            ),
          ],
        ),
      ),
    );
  }
}
