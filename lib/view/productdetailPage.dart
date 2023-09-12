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
  @override
  Widget build(BuildContext context) {
    print(widget.displayInfo);
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
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(trailing: Row(
                    children: [
                      Lottie.asset("assets/animation/estimated_time.json")
                      ,Text(
                              "Hazırlanma Süresi: " +
                                  widget.preperationTime.toString(),
                              style: TextStyle(),
                            ),
                    ],
                  ),)
                  ,
                  ListTile(
                    leading: Text(
                      widget.name,
                      style: TextStyle(fontFamily: "proxima", fontSize: 23),
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
