import 'package:elektraweb_restaurant/view/loginPage.dart';
import 'package:elektraweb_restaurant/view/menuPage.dart';
import 'package:flutter/material.dart';
 
void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}
