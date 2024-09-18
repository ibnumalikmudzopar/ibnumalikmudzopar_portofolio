import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibnumalikmudzopar_portofolio/page/about_page.dart';
import 'package:ibnumalikmudzopar_portofolio/page/work_page.dart';
import 'package:ibnumalikmudzopar_portofolio/page/service_page.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.komperinolabs.web.app');

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  Widget _buildButton(String text, Function onTap){
    return TextButton(
      onPressed: () => onTap(),
      child: Text(
        text,
        style: const TextStyle(
        color: Colors.white,
        fontSize: 16),)
    );
  }

  Future<void> _launchURL() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          children: [
            SizedBox(width: 50),
            Icon(Icons.keyboard, color: Colors.white,), // leading icon
            SizedBox(width: 8),   // jarak antara leading dan title
            Text('SoftDev', style: TextStyle(color: Colors.white, fontSize: 16),),      // title
          ],
        ),
        actions: <Widget> [
          Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
                gradient: LinearGradient( // settingan linear
                  begin:Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black,
                    Colors.blue
                  ]
                )
              ),
            child: Row(
              children: [
                _buildButton('Service', () => Get.to(ServicePage())),
                _buildButton('Blog', () => _launchURL),
                _buildButton('Work', () => Get.to(WorkPage())),
                _buildButton('Contact', () => Get.to(AboutPage())),
                const SizedBox(width: 50,)
              ],
            )),
          
        ],
      ),
      body: Stack(
        children: [
          // Background with blue on the right
          

          // Main content layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 50),
              // Text section on the left
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main text
                      Text(
                        "I'm trying to manage\nmyself, on just\nportfolio.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Subtitle text
                      Text(
                        "Hello I'm Iben, Software Developer\nso anyone who needs to create an apps\nquickly send message",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 32),

                      // Email button with arrow icon
                      OutlinedButton.icon(
                        onPressed: () {
                          // Email action here
                        },
                        icon: Icon(Icons.arrow_forward, color: Colors.white),
                        label: Text("Send Email", style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 2),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Profile image section on the right
              // Profile image section on the right
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    // Blue circle background
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient( // settingan linear
                          begin:Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue,
                            Colors.black
                          ]
                        )
                        ), 
                      ),
                    ),
                    // Profile image (using ClipOval inside a Container)
                    Positioned(
                      right: 150,
                      top: 100, // Penyesuaian posisi
                      child: Container(
                        width: 400,  // Ubah sesuai ukuran yang diinginkan
                        height: 400, // Ubah sesuai ukuran yang diinginkan
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle, // Membuat container berbentuk lingkaran
                          image: DecorationImage(
                            image: AssetImage('lib/assets/img/me.png'),
                            fit: BoxFit.fitHeight, // Memastikan gambar memenuhi lingkaran
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }  
}
