import 'package:elektraweb_restaurant/Global/global.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StreamBuilder<int>(
          stream: selectedIndex$.stream,
          builder: (context, snapshot) {
            return NavigationBar(
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_filled), label: "Home"),
                NavigationDestination(
                  icon: Icon(Icons.bookmark_border_sharp),
                  label: "Saved",
                ),
                /*NavigationDestination(icon: Icon(Icons.add,size: 30),)*/ //Sipariş ekleme özelliği için
                NavigationDestination(
                    icon: Icon(Icons.notifications), label: "Bildirimler"),
                NavigationDestination(
                    icon: Icon(Icons.settings), label: "Ayarlar")
              ],
              selectedIndex: selectedIndex$.value,
              onDestinationSelected: (value) {
                selectedIndex$.value =
                    value; //Global BehaviorSubject objesinin değerini değiştiriyoruz.
              },
            );
          }),
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(fontFamily: "proxima"),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: []),
      )),
    );
  }
}
