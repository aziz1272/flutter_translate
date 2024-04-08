import 'package:flutter/material.dart';
import 'package:flutter_translate/ui/widgets/widget_colors.dart';

class FloatingActionButtonPage extends StatelessWidget {
  String text;
  FloatingActionButtonPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(),
      height: size.height * 0.056,
      width: size.width * 0.94,
      decoration: BoxDecoration(
          color: WidgetColors.specialDark,
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
