import 'package:elektraweb_restaurant/Global/global.dart';
import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:elektraweb_restaurant/models/menu/productModel.dart';
import 'package:elektraweb_restaurant/service/menu_service.dart';
import 'package:elektraweb_restaurant/view/productdetailPage.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  BehaviorSubject<int> selectedIndex$ =
      BehaviorSubject.seeded(0); //bottomnavBar için index
  final service = menuService(); //servis objemiz

  BehaviorSubject<List> selectedproductList$ = BehaviorSubject();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.getRestaurantList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          service.handledepartmentObject(snapshot.data);

          return DefaultTabController(
            length:
                mainDepartmantmodelList$.value[0].productgroupmodelList.length,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                    onTap: (index) {
                      selectedproductList$.value = mainDepartmantmodelList$
                          .value[0]
                          .productgroupmodelList[index]
                          .productmodelList;

                      print(selectedproductList$.value[0].name);
                    },
                    isScrollable: true,
                    tabs: mainDepartmantmodelList$
                        .value[0].productgroupmodelList
                        .map((i) {
                      return Tab(
                        child: Container(
                          child: Text(i.name),
                        ),
                      );
                    }).toList()),
                title: const Text(
                  "Welcome",
                  style: TextStyle(fontFamily: "proxima"),
                ),
                centerTitle: true,
              ),
              bottomNavigationBar: buildbottomNavBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder<List>(
                        stream: selectedproductList$.stream,
                        initialData: selectedproductList$.value =
                            mainDepartmantmodelList$
                                .value[0]
                                .productgroupmodelList[0] //Default Value
                                .productmodelList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print("Butona basildi");
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return productdetailPage(
                                                ImageURL:
                                                    "${selectedproductList$.value[index].imageUrl}",
                                              );
                                            },
                                          ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${selectedproductList$.value[index].imageUrl}")),
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "${snapshot.data![index].name}",
                                            style: TextStyle(
                                                color: Colors.white
                                                ,fontFamily: "proxima",
                                                shadows:<Shadow>[
                                                        Shadow(
                                                          offset: Offset(2.0, 2.0),
                                                          blurRadius: 3.0,
                                                          color: Color.fromARGB(255, 0, 0, 0),
                                                        ),
                                                      ], ),
                                          ),
                                        ), //TODO: Yapilacak.
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong"),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
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
