import 'package:get/get.dart';
import 'page/home_page.dart';
import 'page/about_page.dart';
import 'page/work_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/about', page: () => AboutPage()),
    GetPage(name: '/karya', page: () => WorkPage()),
  ];
}