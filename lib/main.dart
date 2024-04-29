import 'package:flutter/material.dart';
import 'package:flutter_task/app_theme.dart';
import 'package:flutter_task/home/view/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: AppTheme.primary,
          fontFamily: "Montserrat",
          textTheme: const TextTheme()),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
