import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigasi Dasar",
      home: RoutePertama(),
    );
  }
}

class RoutePertama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Pertama"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Tekan tombol di bawah untuk berpindah ke route 2"),
            RaisedButton(
                child: Text("SECOND ROUTE"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RouteKedua()));
                })
          ],
        ),
      ),
    );
  }
}

class RouteKedua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Pertama"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Tekan tombol di bawah untuk kembali ke route 1"),
            RaisedButton(
                child: Text("FIRST ROUTE"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
