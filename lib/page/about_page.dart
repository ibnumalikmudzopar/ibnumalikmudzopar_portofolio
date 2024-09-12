import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me\nIbnu Malik Mudzopar'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Halo, saya [Nama Kamu]. Saya adalah pengembang Flutter yang berfokus pada pembuatan aplikasi mobile dan web. Portofolio ini adalah contoh karya saya.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
