import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Netowrk Check",
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
            body: Center(
                child: Text("CHECK INTERNET CONNECTION",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 22.0)))));
  }
}
