import 'package:flutter/material.dart';
import '../../../constants/style.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
  });

  final VoidCallback? onPressed;
  final Icon icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: radius),
        elevation: 0,
        color: color,
        minWidth: 150,
        height: 50,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(label, style: barTextStyle),
          ],
        ));
  }
}
