import 'package:get/get.dart';
import 'package:kalpasnewsapp/bindings/homescreen_bindings.dart';
import 'package:kalpasnewsapp/bindings/news_screen_bindings.dart';
import 'package:kalpasnewsapp/view/home/home_screen_page.dart';
import 'package:kalpasnewsapp/view/news/news_reading_screen.dart';

class AppRoute {
  static const String homeScreen = '/';
  static const String newsReading = '/news';

  static List<GetPage> pages = [
    GetPage(
        name: homeScreen,
        page: () => const HomeScreenPage(),
        binding: HomescreenBindings()),
    GetPage(
        name: newsReading,
        page: () => const NewsReadingScreen(),
        binding: NewsScreenBindings(),
    )
  ];
}
