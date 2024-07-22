import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  static const routerName = "main_app";

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Container(),
   ) ;
  }
}