//TODO: Ürün detayları api'den geliyor ama nedense stack yapısının altındaki positioned'da gözükmüyor. bunu araştır ve çöz!
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:rxdart/rxdart.dart';

import '../models/model/productModel.dart';

class productdetailPage extends StatefulWidget {
  ProductModel productmodelobject;

  productdetailPage({
    Key? key,
    required this.productmodelobject,
  }) : super(key: key);

  @override
  State<productdetailPage> createState() => _productdetailPageState();
}

class _productdetailPageState extends State<productdetailPage> {
  late final bool isPrepartiontimeNull;
  late final bool isnameAndLocalNameSame;

  final List falseVariables = [];
  final List trueVariables = [];

  BehaviorSubject<bool> isPanelExpanded$ = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<double> heighOfDetails$ = BehaviorSubject();
  @override
  void initState() {
    isPrepartiontimeNull =
        widget.productmodelobject.preperationTime == null ? true : false;
    isnameAndLocalNameSame = checknameSameness(
        widget.productmodelobject.name, widget.productmodelobject.localName);
    Map<String, bool?> boolVariableMap = {
      "vegetarian": widget.productmodelobject.vegetarian,
      "alcohol": widget.productmodelobject.alcohol,
      "allergic": widget.productmodelobject.allergic,
      "pork": widget.productmodelobject.pork,
      "gluten": widget.productmodelobject.gluten,
    };
    handleVariables(boolVariableMap);
    super.initState();
  }

  bool checknameSameness(String name1, String name2) {
    String handledname1 = name1
        .replaceAll(" ", "")
        .replaceAll(",", "")
        .replaceAll(".", "")
        .toLowerCase();
    String handledname2 = name2
        .replaceAll(" ", "")
        .replaceAll(",", "")
        .replaceAll(".", "")
        .toLowerCase();

    return handledname1 == handledname2;
  }

  void handleVariables(Map<String, bool?> boolVariableMap) {
    for (var key in boolVariableMap.keys) {
      if (boolVariableMap[key] == true) {
        trueVariables.add(key);
      } else if (boolVariableMap[key] == false) {
        falseVariables.add(key);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Burasi yapilacak
            },
            icon: Icon(Icons.favorite),
          )
        ],
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: context.getdynamicHeight(0.45),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.productmodelobject.imageUrl))),
          ),
        ),
        StreamBuilder<double>(
            initialData: heighOfDetails$.value = context.getdynamicHeight(0.4),
            stream: heighOfDetails$.stream,
            builder: (context, snapshot) {
              return Positioned(
                top: heighOfDetails$.value,
                width: context.getdynamicWidth(1),
                child: Container(
                  height: context.getdynamicHeight(0.6),
                  width: context.getdynamicWidth(1),
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: context.getdynamicHeight(0.02),
                        left: 15,
                        right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: context.getdynamicHeight(0.03),
                            ),
                            Expanded(
                              child: Text(
                                widget.productmodelobject.name,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "proxima",
                                    fontSize: 23),
                              ),
                            )
                          ],
                        ),
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: context.getdynamicWidth(0.05),
                              ),
                              Opacity(
                                opacity: !isnameAndLocalNameSame ? 0.0 : 1.0,
                                child: Expanded(
                                  child: Text(
                                    widget.productmodelobject.localName,
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: !isPrepartiontimeNull,
                                  child: Row(children: [
                                    SizedBox(
                                      height: context.getdynamicHeight(0.08),
                                      width: context.getdynamicWidth(0.07),
                                      child: Lottie.asset(
                                          "assets/animation/preparing_time.json"),
                                    ),
                                    Text(
                                        "Hazirlanma süresi: ${widget.productmodelobject.preperationTime} ")
                                  ]))
                            ]),
                        SizedBox(
                          height: context.getdynamicHeight(0.02),
                        ),
                        Text(
                          widget.productmodelobject.displayInfo.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "proxima",
                          ),
                        ),
                        SizedBox(
                          height: context.getdynamicHeight(0.02),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: trueVariables.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  title: Text(trueVariables[index]),
                                );
                              }),
                        ),
                        ExpansionTile(
                          title: Text("Besin degerleri"),
                          children: [
                            ListTile()
                          ],
                          
                          onExpansionChanged: (value) {
                            if (value) {
                              heighOfDetails$.value =
                                  context.getdynamicHeight(0.09);
                            } else {
                              heighOfDetails$.value =
                                  context.getdynamicHeight(0.4);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ]),
    );
  }
}
