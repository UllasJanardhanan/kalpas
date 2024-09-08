import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kalpasnewsapp/constants/colors.dart';

import '../../../constants/style.dart';

class BuildTileItem extends StatelessWidget {
  const BuildTileItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.publishedDate,
    this.onTap,
  });
  final String imageUrl;
  final String title;
  final String content;
  final String publishedDate;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(-1, 2), 
              ),
            ],
            borderRadius: radius,
            color: appBgColor,
          ),
          child: ListTile(
            minVerticalPadding: 18,
            dense: true,
            visualDensity: const VisualDensity(vertical: 4), // to c
            leading: ClipRRect(
                borderRadius: radius,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 100,
                  width: 75,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
    );
  }
}
