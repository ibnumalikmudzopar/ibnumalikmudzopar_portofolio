import 'package:flutter/material.dart';

class KaryaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karya Saya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Project 1: Aplikasi Pengelolaan UKM'),
            Text('Project 2: Sistem Informasi Desa'),
            // Tambahkan karya lainnya di sini
          ],
        ),
      ),
    );
  }
}
