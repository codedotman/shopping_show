import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_show/data/controller/product_controller.dart';
import 'package:shopping_show/features/product/maka_product_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductController()),
      ],
      child: MaterialApp(
        title: 'Maka Demo',
        theme: ThemeData(primarySwatch: Colors.blue, textTheme: getTextTheme),
        home: const MakaHomeScreen(),
      ),
    );
  }

  TextTheme get getTextTheme => const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 26,
        ),
        headline3: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        headline6: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        subtitle2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 8,
        ),
        bodyText2: TextStyle(
          fontSize: 30,
        ),
        bodyText1: TextStyle(
          fontSize: 12,
        ),
      );
}
