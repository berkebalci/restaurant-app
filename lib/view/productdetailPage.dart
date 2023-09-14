import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class productdetailPage extends StatefulWidget {
  final int id;
  final String name;
  final String localName;
  final String price;
  final String curCode;
  final String? preparePlace;
  final int productGroupId;
  final String imageUrl;
  final bool? halfPortion;
  final bool? includedInAi;
  final bool? isPackage;
  final String? displayInfo;
  final String? localDisplayInfo;
  final bool? allergic;
  final bool? vegetarian;
  final bool? alcohol;
  final bool? pork;
  final bool? gluten;
  final int? preperationTime;
  final String? allergens;
  final double? calories;
  final double? cholesterol;
  final double? sodium;
  final double? carbonHydrates;
  final double? protein;
  final double? fat;
  final double? fiber;

  productdetailPage(
      {super.key,
      required this.displayInfo,
      required this.id,
      required this.name,
      required this.localName,
      required this.price,
      required this.curCode,
      this.preparePlace,
      required this.productGroupId,
      required this.imageUrl,
      this.halfPortion,
      this.includedInAi,
      this.isPackage,
      this.localDisplayInfo,
      this.allergic,
      this.vegetarian,
      this.alcohol,
      this.pork,
      this.gluten,
      this.preperationTime,
      this.allergens,
      this.calories,
      this.cholesterol,
      this.sodium,
      this.carbonHydrates,
      this.protein,
      this.fat,
      this.fiber});

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
    isPrepartiontimeNull = widget.preperationTime == null ? true : false;
    isnameAndLocalNameSame = checknameSameness(widget.name, widget.localName);
    Map<String, bool?> boolVariableMap = {
      "vegetarian": widget.vegetarian,
      "alcohol": widget.alcohol,
      "allergic": widget.allergic,
      "pork": widget.pork,
      "gluten": widget.gluten,
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
    print(widget.displayInfo);
    print(isPrepartiontimeNull.toString() + widget.preperationTime.toString());
    print(isnameAndLocalNameSame);

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
                  fit: BoxFit.cover, image: NetworkImage(widget.imageUrl))),
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
                        Text(
                          widget.name,
                          style: TextStyle(fontFamily: "proxima", fontSize: 23),
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
                            child: Text(
                              widget.localName,
                              style: TextStyle(fontStyle: FontStyle.italic),
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
                                    "Hazirlanma süresi: ${widget.preperationTime} ")
                              ]))
                        ]),
                    SizedBox(
                      height: context.getdynamicHeight(0.02),
                    ),
                    Text(
                      widget.displayInfo.toString(),
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
                              leading: Icon(Icons.check,color: Colors.green,),
                              title: Text(element),
                            );
                          }).toList()),
                        ),
                        Expanded(
                          child: Column(
                            children: falseVariables.map((element) {
                            return ListTile(
                              leading: Icon(Icons.clear,color: Colors.red,),
                              title: Text(element),
                            );
                          }).toList() ,
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
