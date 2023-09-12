import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class productdetailPage extends StatefulWidget {
  String ImageURL;
  String displayInfo;
  productdetailPage(
      {super.key, required this.ImageURL, required this.displayInfo});

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
              icon: Icon(Icons.favorite),)
        ],
      ),
      body: Stack(children: [
        Container(
          height: context.getdynamicHeight(0.5),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.ImageURL))),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              height: context.getdynamicHeight(0.6),
              child: ListView(
                children: [

                ],
              ),
            ))
      ]),
    );
  }
}
