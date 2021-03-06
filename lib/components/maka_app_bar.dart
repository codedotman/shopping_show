import 'package:flutter/material.dart';
import 'package:shopping_show/utils/maka_colors.dart';

class MakaAppBar extends AppBar {
  MakaAppBar({
    Key? key,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    Widget? title,
    List<Widget>? actions,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    double elevation = 0,
    Color? backgroundColor,
    Brightness? brightness,
    IconThemeData? iconTheme,
    TextTheme? textTheme,
    bool primary = true,
    bool? centerTitle,
    double titleSpacing = NavigationToolbar.kMiddleSpacing,
    double toolbarOpacity = 1,
    double bottomOpacity = 1,
  }) : super(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace ??
              Container(
                color: primaryColor,
              ),
          bottom: bottom,
          elevation: elevation,
          backgroundColor: Colors.transparent,
          brightness: brightness,
          iconTheme: iconTheme ?? const IconThemeData(color: Colors.black),
          textTheme: textTheme,
          primary: primary,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
        );
}
