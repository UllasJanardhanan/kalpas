import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kalpasnewsapp/constants/colors.dart';

import '../../../constants/style.dart';

// ignore: must_be_immutable
class BuildSlidableTileItem extends StatelessWidget {
  BuildSlidableTileItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.publishedDate,
    this.onTap,
    this.onSlide,
  });
  final String imageUrl;
  final String title;
  final String content;
  final String publishedDate;
  final VoidCallback? onTap;
  void Function(BuildContext)? onSlide;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 8),
              icon: Icons.favorite,
              label: "Add to Favorite",
              foregroundColor: iconColor,
              backgroundColor: const Color.fromARGB(255, 252, 209, 209),
              onPressed: onSlide,
            )
          ]),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: appBgColor,
            ),
            child: ListTile(
              minVerticalPadding: 18,
              dense: true,
              visualDensity: const VisualDensity(vertical: 4),
              leading: ClipRRect(
                  borderRadius: radius,
                  child: Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            maxHeight: 100, maxWidth: 75, errorListener: (err) {
                        }, imageUrl),
                      ),
                    ),
                  )),
              title: Text(
                title,
                maxLines: 1,
                style: titleTextStyle,
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(content, maxLines: 2, style: contentTextStyle),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          publishedDate.toString(),
                          style: dateTimeTextStyle,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
