import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpasnewsapp/model/newsmodel/news_model.dart';
import 'package:kalpasnewsapp/services/api_services.dart';

class HomeScreenController extends GetxController {
  late int selectedIndex;
  List<Article> articles = [];
  List<Article> favoriteArticles = [];

  @override
  void onInit() {
    selectedIndex = 0;
    getNews();
    super.onInit();
  }

  void switchTab() {
    selectedIndex = selectedIndex > 0 ? selectedIndex - 1 : selectedIndex + 1;
    update();
  }

  void getNews() async {
    NewsModel? news = await ApiClient.fetchNews();        
    if (news != null) {
      articles.addAll(news.articles);
      update();
    }
  }

  void addToFavourites(Article article) async {
    for (var favs in favoriteArticles) {
      if (identical(article, favs)) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text("Already added to Favourites"),
        ));
        return;
      }
    }
    favoriteArticles.add(article);
  }
}
