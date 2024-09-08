import 'package:get/get.dart';
import '../controller/news_screen_controller.dart';

class NewsScreenBindings extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<NewsScreenController>(() => NewsScreenController());
  }
}