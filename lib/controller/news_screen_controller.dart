import 'package:get/get.dart';

import '../model/newsmodel/news_model.dart';

class NewsScreenController extends GetxController {
  late Article article;
  @override
  void onInit() {
    readNews();
    super.onInit();
  }

  void readNews() {
     article = Get.arguments;
     print(article.content);
  }
}
