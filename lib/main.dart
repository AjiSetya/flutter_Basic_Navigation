import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigasi Dasar",
      // jika menggunakan initial route, tidak usah pakai home
      // home: RoutePertama(),
      initialRoute: '/', // nama halaman / tampilan utama
      routes: {
        '/': (context) => RoutePertama(),
        '/routekedua': (context) => RouteKedua(),
        '/routeketiga': (context) => RouteKetiga(),
        '/routekeempat': (context) => RouteKeempat()
      },
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
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => RouteKedua()));

                  Navigator.pushNamed(context, '/routekedua');
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
        title: Text("Route Kedua"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tekan tombol di bawah untuk kembali ke route 1"),
            RaisedButton(
                child: Text("FIRST ROUTE"),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text("Tekan tombol di bawah untuk pergi ke route 3"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                  child: Text("ROUTE 3"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/routeketiga',
                        arguments: ArgumentsRouteKetiga('judul tampilan ke 3',
                            'Tekan tombol untuk kembali ke route sebelumnya'));

                    //Navigator.push(context,
                    //MaterialPageRoute(builder: (context) => RouteKetiga()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ArgumentsRouteKetiga {
  String a, b;

  ArgumentsRouteKetiga(this.a, this.b);
}

class RouteKetiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ArgumentsRouteKetiga arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.a),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(arguments.b),
            RaisedButton(
                child: Text('ROUTE 2'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Text(
                "Pilih data dari halaman yang akan dibuka ketika tombol diklik"),
            RaisedButton(
                child: Text("PILIH DATA"),
                onPressed: () {
                  _bukaTampilanDapatkanData(context);
                })
          ],
        ),
      ),
    );
  }

  _bukaTampilanDapatkanData(BuildContext context) async {
    // membuka route 4 tapi menunggu data dari route 4
    // jika data sudah didapat, route 4 ditutup dan data masuk ke hasildata
    final hasilData = await Navigator.pushNamed(context, '/routekeempat');

    // data ditampilkan di snackbar
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$hasilData")));
  }
}

class RouteKeempat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        RaisedButton(
            child: Text("Kucing"),
            onPressed: () {
              Navigator.pop(context, 'Kamu memilih kucing');
            }),
        RaisedButton(
            child: Text("Bebek"),
            onPressed: () {
              Navigator.pop(context, 'Kamu memilih bebek');
            }),
      ],
    );
  }
}
