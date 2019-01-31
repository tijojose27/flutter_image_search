import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_serach_app/ImageData.dart';
import 'package:http/http.dart' as http;

String api = "https://pixabay.com/api/?per_page=10&key=";

String myKey = "5453088-218952e2727878edb32932aef&q=";

class ImageResults extends StatefulWidget {
  ImageResults({this.searchText});
  String searchText;
  @override
  State<StatefulWidget> createState() {
    return new _ImageResults();
  }
}

class _ImageResults extends State<ImageResults> {
  String currApi = "";

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  fetchData(){
    return this._memoizer.runOnce(() async{
      var result = await http.get(currApi);
      print("CALLING FETCH DATA");
      final jsonResponse = json.decode(result.body);
      ImageData data = ImageData.fromJson(jsonResponse);
      return data;
    });
  }

  //INIT STATE
  @override
  initState() {
    super.initState();
    currApi = api + myKey + widget.searchText;
    print(currApi);
  }

  //BUILDER
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
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: Center(child: myFutureBuilder()
                )));
  }

  Widget myFutureBuilder() {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          ImageData currData = snapshot.data;
          print(snapshot.data.toString());
          if (snapshot.data != null) {
            if(currData.totalHits!=0) {
              return ListView.builder(
                  itemCount: currData.hits.length,
                  itemBuilder: (context, position) {
                    return Padding(
                        padding: EdgeInsets.all(50.0),
                        child: Card(
                            elevation: 15.0,
                            child: Column(
                              children: <Widget>[
                                Image.network(
                                    currData.hits[position].webformatURL
                                        .toString()),
                                Text(
                                  widget.searchText,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )
                              ],
                            )));
                  });
            }else{
              return Center(
                child: Text("NO IMAGES FOUND", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.red),),
              );
            }
          } else {
            print(snapshot.error.toString());
            return new Container(

            );
          }
        });
  }
}
