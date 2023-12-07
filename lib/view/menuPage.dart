import 'package:elektraweb_restaurant/Global/global.dart';
import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:elektraweb_restaurant/models/model/productModel.dart';
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
                backgroundColor: Colors.transparent,
                bottom: TabBar(
                    onTap: (index) {
                      selectedproductList$.value = mainDepartmantmodelList$
                          .value[0]  //TODO: Burasi geliştirilebilir
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
                  "Menu",
                  style: TextStyle(fontFamily: "proxima"),
                ),
                centerTitle: true,
              ),
              bottomNavigationBar: buildbottomNavBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: context.getdynamicHeight(0.02),),
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
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "${selectedproductList$.value[index].imageUrl}"),
                                            ),
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print("Butona basildi");
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return productdetailPage(
                                            productmodelobject: selectedproductList$.value[index],);
                                            },
                                          ));
                                        },
                                        child:  Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.white,
                                                gradient: LinearGradient(
                                                    begin: FractionalOffset
                                                        .topCenter,
                                                    end: FractionalOffset
                                                        .bottomCenter,
                                                    colors: [
                                                      Colors.transparent
                                                          .withOpacity(0),
                                                      Colors.transparent
                                                          .withOpacity(0),
                                                      Colors.black,
                                                    ],
                                                    stops: [
                                                      0.0,
                                                      0.6,
                                                      1.0
                                                    ]))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "${snapshot.data![index].name}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "proxima",
                                            ),
                                          ),
                                        ), 
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
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
