import 'package:elektraweb_restaurant/Global/global.dart';
import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:elektraweb_restaurant/service/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  BehaviorSubject<int> selectedIndex$ =
      BehaviorSubject.seeded(0); //bottomnavBar için index
  final service = menuService(); //servis objemiz
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text("data"),
              Text("dfsfsfsf"),
              Text("fsfs")
            ]),
          title: Text(
            "Welcome",
            style: TextStyle(fontFamily: "proxima"),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: StreamBuilder<int>(
            stream: selectedIndex$.stream,
            builder: (context, snapshot) {
              return NavigationBar(
                destinations: [
                  const NavigationDestination(
                      icon: Icon(Icons.home_filled), label: "Home"),
                  const NavigationDestination(
                    icon: Icon(Icons.bookmark_border_sharp),
                    label: "Saved",
                  ),
                  /*NavigationDestination(icon: Icon(Icons.add,size: 30),)*/ //Sipariş ekleme özelliği için
                  const NavigationDestination(
                      icon: Icon(Icons.notifications), label: "Bildirimler"),
                  const NavigationDestination(
                      icon: Icon(Icons.settings), label: "Ayarlar")
                ],
                selectedIndex: selectedIndex$.value,
                onDestinationSelected: (value) {
                  selectedIndex$.value =
                      value; //Global BehaviorSubject objesinin değerini değiştiriyoruz.
                },
              );
            }),
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(children: [Text("dfs")]),
              FutureBuilder(
                future: service.getRestaurantList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    service.handlerestaurantObject(snapshot
                        .data); //BehaviorSubject objesinin değerini değiştiriyoruz.
            
                    List menuList =
                        snapshot.data[2]; //Bütün yemeklerin olduğu liste
                    //TODO: yukarıdaki listeyi sil
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics()
                      ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: menuList.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              color: Colors.red,
                            ),
                            Text("${menuList[index]["NAME"]}"),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
