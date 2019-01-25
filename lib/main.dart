import 'package:flutter/material.dart';

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
  bool validate;
  @override
  State<StatefulWidget> createState() {
    return _searchCard(validate);
  }
}

class _searchCard extends State<searchCard> {
  _searchCard(this._validate);
  String value = "";
  String error = "";
  final _text = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News App"),
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
              _text.text.isEmpty ? _validate=true : _validate=false;
              print(_validate);
            });
          },
        ));
  }

  Widget myTextField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: TextField(
          decoration: InputDecoration(
              labelText: "Enter Search",
              errorText: _validate ? 'Search is empty' : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        )
    );
  }

  bool searchisEmpty(String search) {
    if (search.length <= 0) {
      print("ITS EMPTU");
      error = "Nothing in search Field";
      return false;
    }
    print("ITS NOT EMPTYU");
    error = "";
    return true;
  }
}
