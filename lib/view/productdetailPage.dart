// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:elektraweb_restaurant/extensions/context_extension.dart';

import '../models/menu/productModel.dart';

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

  @override
  void initState() {
    isPrepartiontimeNull = widget.productmodelobject.preperationTime == null ? true : false;
    isnameAndLocalNameSame = checknameSameness(widget.productmodelobject.name, widget.productmodelobject.localName);
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
        Container(
          height: context.getdynamicHeight(0.45),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.productmodelobject.imageUrl))),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.getdynamicWidth(1),
              height: context.getdynamicHeight(0.6),
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.getdynamicHeight(0.02),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: context.getdynamicHeight(0.03),
                        ),
                        Expanded(
                          child: Text(
                            widget.productmodelobject.name,
                            style:
                                TextStyle(fontFamily: "proxima", fontSize: 23),
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
                                style: TextStyle(fontStyle: FontStyle.italic),
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                              children: trueVariables.map((element) {
                            return ListTile(
                              leading: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              title: Text(element),
                            );
                          }).toList()),
                        ),
                        Expanded(
                          child: Column(
                            children: falseVariables.map((element) {
                              return ListTile(
                                leading: Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                                title: Text(element),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
