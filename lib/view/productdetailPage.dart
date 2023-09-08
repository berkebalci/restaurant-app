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
        actions: [IconButton(onPressed: () {
          
        }, icon: Icon(
          
          Icons.favorite))],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover
            ,image: NetworkImage(widget.ImageURL))
        ),
      ),
    );
  }
}