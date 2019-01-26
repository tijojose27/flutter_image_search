import 'package:flutter/material.dart';

class imageResults extends StatelessWidget{

  imageResults({this.searchTxt});

  final String searchTxt;

  final String api = "https://pixabay.com/api/?per_page=10&key=";

  final String myKey = "5453088-218952e2727878edb32932aef";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Image Search",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Images"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
        body: Center(
          child: Text(searchTxt),
        ),
    ));
  }

}