import 'package:basit_burc_projesi/burc_liste.dart';
import 'package:flutter/material.dart';
import 'models/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;
  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;

  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBulma();
  }

  void baskinRengiBulma() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + secilenBurc.buyukResim));

    fPaletGenerator.then((value) {
      paletteGenerator = value;
      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            primary: true,
            pinned: true,
            backgroundColor:
                baskinRenk != null ? baskinRenk : Colors.pink.shade400,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.adi + " Burcu ve Özellikleri"),
              background: Image.asset(
                "images/" + secilenBurc.buyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: SingleChildScrollView(
                child: Text(
                  secilenBurc.detayi,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
