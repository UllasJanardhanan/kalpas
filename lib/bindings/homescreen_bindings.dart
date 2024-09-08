import 'package:get/get.dart';
import 'package:kalpasnewsapp/controller/home_screen_controller.dart';

class HomescreenBindings extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}