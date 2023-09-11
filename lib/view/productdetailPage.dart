import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class productdetailPage extends StatefulWidget {
  String ImageURL;
   productdetailPage({super.key,required this.ImageURL});

  @override
  State<productdetailPage> createState() => _productdetailPageState();
}

class _productdetailPageState extends State<productdetailPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent
        ,elevation: 0,
        actions: [
          IconButton(
           onPressed: () {
          //TODO: Burasi yapilacak
        }, icon: Icon(
          Icons.favorite))],
      ),
      body: Stack(
        children: [
          Container(
            height: context.getdynamicHeight(0.4)
            ,decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover
                ,image: NetworkImage(widget.ImageURL))
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter
            ,child: Container(
              decoration: BoxDecoration(color: Colors.grey)
              ,height: context.getdynamicHeight(0.6),))
           

        
        ]
      ),
    );
  }
}