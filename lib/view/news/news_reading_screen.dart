import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpasnewsapp/constants/style.dart';
import 'package:kalpasnewsapp/controller/news_screen_controller.dart';
import 'package:kalpasnewsapp/services/utils.dart';
import '../../constants/colors.dart';

class NewsReadingScreen extends GetView<NewsScreenController> {
  const NewsReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: appBgColor,
        leadingWidth: 100, // default is 56
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                ),
                SizedBox(width: 5),
                Expanded(
                    child: Text(
                  "Back",
                  style: titleTextStyle,
                ))
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: radius,
                color: appBgColor,
              ),
              child: ClipRRect(
                  borderRadius: radius,
                  child:  CachedNetworkImage(
                        imageUrl: controller.article.urlToImage??"",
                        height: 100,
                        width: 75,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    
                  ),
            ),
                        const SizedBox(height: 15),
            Text(controller.article.title??"Not Availble",style: titleTextStyle),
            Row(children: [
              const Icon(Icons.calendar_month),
              Expanded(child: Text(formatTimestamp(controller.article.publishedAt),style: dateTimeTextStyle))
            ],),
            const SizedBox(height: 15),
            Text(controller.article.content??"Not Available",style: contentTextStyle,softWrap: true,
                overflow: TextOverflow.visible,),
          ],
        ),
      ),
    );
  }
}
