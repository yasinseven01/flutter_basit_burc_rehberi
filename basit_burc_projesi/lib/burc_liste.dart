import 'package:basit_burc_projesi/models/burc.dart';
import 'package:basit_burc_projesi/utils/strings.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar = veriKaynaginiHazirlama();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Burç Rehberiniz",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: listeyiHazirlama(),
    );
  }

  static List<Burc> veriKaynaginiHazirlama() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukRes = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukRes =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";
      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukRes,
          buyukRes);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirlama() {
    return ListView.builder(
      itemCount: tumBurclar.length,
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oAnListelenenBurc = tumBurclar[index];

    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/burcDetay/$index");
        },
        // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BurcDetay(index)));
        leading: Image.asset(
          "images/" + oAnListelenenBurc.kucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(
          oAnListelenenBurc.adi,
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Colors.pink.shade400),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            oAnListelenenBurc.tarihi,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.pink.shade400,
        ),
      ),
    );
  }
}
