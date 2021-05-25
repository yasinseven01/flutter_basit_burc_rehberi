import 'package:basit_burc_projesi/burc_detay.dart';
import 'package:basit_burc_projesi/burc_liste.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberiniz",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",
      routes: {
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == 'burcDetay') {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: BurcListesi(),
    );
  }
}
