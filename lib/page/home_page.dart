import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibnumalikmudzopar_portofolio/page/about_page.dart';
import 'package:ibnumalikmudzopar_portofolio/page/work_page.dart';
import 'package:ibnumalikmudzopar_portofolio/page/service_page.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.komperinolabs.web.app');

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Tambahkan GlobalKey untuk bagian "What Do I Help You"
  final GlobalKey _serviceSectionKey = GlobalKey();

  Widget _buildButton(String text, Function onTap) {
    return TextButton(
      onPressed: () => onTap(),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void _scrollToServiceSection() {
    // Menggunakan Scrollable.ensureVisible untuk scroll ke bagian Service
    Scrollable.ensureVisible(
      _serviceSectionKey.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 30.0,
            floating: false,
            pinned: false,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: const [
                  Icon(Icons.keyboard, color: Colors.white),
                  SizedBox(width: 8),
                  Text('SoftDev', style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              background: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black, Colors.blue],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              _buildButton('Service', _scrollToServiceSection), // Scroll ke bagian service
              _buildButton('Blog', _launchURL),
              _buildButton('Work', () => Get.to(WorkPage())),
              _buildButton('Contact', () => Get.to(AboutPage())),
              SizedBox(width: 50,),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 70.0), // atur posisi text
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 110), //diatas text im tryng
                        const Text(
                          "I'm trying to manage\nmyself, on just\nportfolio.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Hello I'm Iben, Software Developer\nso anyone who needs to create an apps\nquickly send message",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 32),
                        OutlinedButton.icon(
                          onPressed: () {
                            // Aksi untuk email
                          },
                          icon: const Icon(Icons.arrow_forward, color: Colors.white),
                          label: const Text("Send Email", style: TextStyle(color: Colors.white)),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white, width: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70), // kotak diatas poto
                        Container(
                          width: 400,
                          height: 400,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('lib/assets/img/me.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 70), // kotak dibawah poto
                      ],
                    ),
                  ),
                  Container(
                    width: 50, // besar kotak di pinggir poto
                    height: 250.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient( // settingan linear
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue,
                          Colors.black
                        ]
                      )
                    ), 
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            // Halaman Kedua dengan Background Putih dan Grid
            child: Container(
              key: _serviceSectionKey, // Tambahkan GlobalKey di sini
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'What Do I Help You',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'Basically, I can create your dream website, Mobile Apps And iOS',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(3, (index) {
                      return Container(
                        color: Colors.blue[100 * (index % 9)],
                        child: Center(
                          child: Text(
                            'Grid Item $index',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
