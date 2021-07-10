import 'package:flutter/material.dart';
import 'gonderikart.dart';

class ProfilSayfasi extends StatelessWidget {
  final String? isimSoyad;
  final String? kullaniciAdi;
  final String? kapakResimLinki;
  final String? profilResimLinki;

  const ProfilSayfasi(
      {Key? key,
      this.isimSoyad,
      this.kullaniciAdi,
      this.kapakResimLinki,
      this.profilResimLinki})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 230.0,
                  //color: Colors.purple,
                ),
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(kapakResimLinki!),
                    ),
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 0.0,
                  child: Hero(
                    tag: "UcanProfilResmi" + kullaniciAdi!,
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(width: 2.0, color: Colors.white),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(profilResimLinki!),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 190.0,
                  left: 145.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isimSoyad!,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        kullaniciAdi!,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 130.0,
                  right: 15.0,
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.green.shade200,
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle, size: 18.0),
                        SizedBox(width: 2.0),
                        Text(
                          "Takip Et",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context, "Döndüm");
                    }),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 75.0,
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sayac("Takipçi", "20K"),
                  sayac("Takip", "500"),
                  sayac("Paylaşım", "75"),
                ],
              ),
            ),
            GonderiKart(
              profilResimLinki:
                  "https://cdn.pixabay.com/photo/2017/08/07/16/39/girl-2605526_960_720.jpg",
              isimSoyad: "Emma Watson",
              gecenSure: "1 saat önce",
              gonderiResimLinki:
                  "https://cdn.pixabay.com/photo/2021/06/27/17/50/redstart-6369564_960_720.jpg",
              aciklama: "Sonbahar da güzel kuş türleri çıkıyor....",
            ),
          ],
        ));
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sayi,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 1.0),
        Text(
          baslik,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
