import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_api_and_ui/controller/home_screen_controller.dart';
import 'package:shopping_cart_api_and_ui/view/homescreen/homescreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ], child: HomePage()),
    );
  }
}
