import 'package:flutter/material.dart';
import 'package:shopping_show/utils/maka_colors.dart';

class MakaButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color textColor, backgroundColor;
  final bool enable;

  const MakaButton({
    Key? key,
    required this.title,
    required this.callback,
    this.textColor = Colors.white,
    this.backgroundColor = primaryColor,
    this.enable = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enable ? callback : null,
      child: Container(
        height: 49,
        decoration: BoxDecoration(
            color: enable ? backgroundColor : backgroundColor.withOpacity(0.3),
            border: Border.all(color: Colors.transparent, width: 0.9),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: textColor, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}
