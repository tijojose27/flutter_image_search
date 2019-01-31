import 'package:flutter/material.dart';
import 'package:flutter_image_serach_app/imageResults.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: searchCard());
  }
}

class searchCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _searchCard();
  }
}

class _searchCard extends State<searchCard> {

  String value = "";
  String error = "";
  final _text = TextEditingController();
  bool isEmpty = false;

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    // This also removes the _printLatestValue listener
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print("ISEMPTY AT START = "+isEmpty.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Image Search App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 140.0,
            height: 140.0,
            child: Image.asset("images/camera.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: myTextField(),
              ),
              searchIcon()
            ],
          ),
          Text(
            error,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget searchIcon() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
        child: IconButton(
          icon: Icon(Icons.search),
          iconSize: 40.0,
          onPressed: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            setState(() {
              if(_text.text.isEmpty){
//                print("ITS EMPTUY");
                isEmpty=true;
              }else{
//                print("ITS NOT EMPTU");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageResults(searchText: _text.text,)));
              }
//              print(("Search Button clicked ISEMPTY = "+isEmpty.toString()));
            });
          },
        ));
  }

  Widget myTextField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: TextField(
          controller: _text,
          decoration: InputDecoration(
              labelText: "Enter Search",
              errorText: isEmpty ? 'Search is empty' : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        )
    );
  }

}
