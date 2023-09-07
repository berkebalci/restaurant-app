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
  BehaviorSubject<String> selectedCategory$ =
      BehaviorSubject.seeded("Aperatifler");
  final service = menuService(); //servis objemiz
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  method(){
    
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (value) {
                //TODO: Burasi yapilacak
              },
              isScrollable: true,
              tabs: mainDepartmantmodelList$.value[0].productgroupmodelList.map((i) {
                return Tab(
                  child: Container(
                    child: Text(i.name),
                    color: Colors.blue,
                  ),
                );
              }).toList()
              ),
          title: Text(
            "Welcome",
            style: TextStyle(fontFamily: "proxima"),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: buildbottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: service.getRestaurantList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                     //BehaviorSubject objesinin değerini değiştiriyoruz.

                    service.getproductList("Aperatifler");
                    //Bütün yemeklerin olduğu liste

                    return StreamBuilder(
                        stream: selectedCategory$.stream,
                        builder: (context, snapshot) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        });
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

  StreamBuilder<int> buildbottomNavBar() {
    return StreamBuilder<int>(
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
          });
  }
}
