import 'package:flutter/material.dart';
import 'package:kalpasnewsapp/constants/colors.dart';
import 'bar_button.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      this.newsButtonOnPressed,
      this.favsButtonOnPressed,
      required this.selectedIndex});
  final VoidCallback? newsButtonOnPressed;
  final VoidCallback? favsButtonOnPressed;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BarButton(
          onPressed: newsButtonOnPressed,
          icon: const Icon(Icons.format_list_bulleted, size: 32),
          label: 'News',
          color: selectedIndex == 0 ? selectedColor : appBgColor,
        ),
        const SizedBox(width: 15),
        BarButton(
          onPressed: favsButtonOnPressed,
          icon: const Icon(Icons.favorite, size: 32, color: iconColor),
          label: 'Favs',
          color: selectedIndex == 1 ? selectedColor : appBgColor,
        ),
      ],
    );
  }
}
