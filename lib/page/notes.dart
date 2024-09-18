import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(Icons.keyboard_alt_outlined, size: 30, color: Colors.white,),
            SizedBox(width: 2),
            Text('SoftDev', style: TextStyle(fontSize: 16, color: Colors.white),),
            // Spacer(),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin:Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black,
                    Colors.blue
                  ]
                )
              ),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  children: [
                    _buildButton('Service'),
                    _buildButton('Blog'),
                    _buildButton('Work'),
                    _buildButton('Contact '),
                    ],
                ),
              ),
            )
          ],
        ),
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
  
  Widget _buildButton(String text){
    return TextButton(
      onPressed: (){},
      child: Text(
        text,
        style: TextStyle(
        color: Colors.white,
        fontSize: 16),)
    );
  }
  
}
