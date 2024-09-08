import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpasnewsapp/controller/home_screen_controller.dart';
import 'package:kalpasnewsapp/constants/colors.dart';
import 'package:kalpasnewsapp/routes/routes.dart';
import 'package:kalpasnewsapp/services/utils.dart';
import 'package:kalpasnewsapp/view/home/widgets/app_bar_widget.dart';

import 'widgets/list_tile.dart';
import 'widgets/slidable_tile.dart';

class HomeScreenPage extends GetView<HomeScreenController> {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          foregroundColor: appBgColor,
          backgroundColor: appBgColor,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: GetBuilder(
                  init: HomeScreenController(),
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppBarWidget(
                        newsButtonOnPressed: () {
                          controller.switchTab();
                        },
                        favsButtonOnPressed: () {
                          controller.switchTab();
                        },
                        selectedIndex: controller.selectedIndex,
                      ),
                    );
                  }))),
      body: GetBuilder(
          init: HomeScreenController(),
          builder: (controller) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (controller.selectedIndex == 0) {
                  return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildSlidableTileItem(
                          onSlide: (val) {
                            controller
                                .addToFavourites(controller.articles[index]);
                          },
                          imageUrl: controller.articles[index].urlToImage ?? "",
                          title: controller.articles[index].title ??
                              "Not Available",
                          content: controller.articles[index].description ??
                              "Not Available",
                          publishedDate: formatTimestamp(
                              controller.articles[index].publishedAt),
                          onTap: () {Get.toNamed(AppRoute.newsReading,arguments: controller.articles[index]);},
                        );
                      });
                } else {
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.favoriteArticles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildTileItem(
                            imageUrl:
                                controller.favoriteArticles[index].urlToImage ??
                                    "",
                            title:
                                controller.favoriteArticles[index].title ?? "",
                            content:
                                controller.favoriteArticles[index].content ??
                                    "",
                            publishedDate: formatTimestamp(controller
                                .favoriteArticles[index].publishedAt));
                      });
                }
              },
            );
          }),
    );
  }
}
