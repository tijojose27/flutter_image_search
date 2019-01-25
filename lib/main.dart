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

class searchCard extends StatelessWidget {
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
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 40.0,
                    onPressed: () {},
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget myTextField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: TextField(
          decoration: InputDecoration(
              labelText: "Enter Search",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ));
  }
}
