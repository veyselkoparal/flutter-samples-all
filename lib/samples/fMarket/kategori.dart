import 'package:flutter/material.dart';
import 'urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key? key, required this.kategori}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  late List<Widget> gosterilecekListe;

  @override
  void initState() {
    super.initState();

    if (widget.kategori == "temel gıda") {
      gosterilecekListe = [
        urunKarti(
          "Maydanoz",
          "10 TL",
          "https://cdn.pixabay.com/photo/2016/03/10/18/44/top-view-1248955_960_720.jpg",
          mevcut: true,
        ),
        urunKarti(
          "Süt",
          "3.5 TL",
          "https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887237_960_720.jpg",
        ),
        urunKarti(
          "Et 1 Kg",
          "30 TL",
          "https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_960_720.jpg",
          mevcut: true,
        ),
        urunKarti(
          "Yumurta 8'li",
          "12.50 TL",
          "https://cdn.pixabay.com/photo/2015/09/17/17/19/eggs-944495_960_720.jpg",
          mevcut: true,
        ),
        urunKarti(
          "Çay",
          "30 TL",
          "https://cdn.pixabay.com/photo/2015/03/26/09/45/person-690245_960_720.jpg",
          mevcut: true,
        ),
        urunKarti(
          "Ketçap",
          "10.50 TL",
          "https://cdn.pixabay.com/photo/2016/06/10/15/16/tomatoes-1448267_960_720.jpg",
        ),
      ];
    } else if (widget.kategori == "şekerleme") {
      gosterilecekListe = [
        urunKarti(
          "Çikolata Hediyelik",
          "22.50 TL",
          "https://cdn.pixabay.com/photo/2017/02/11/14/19/valentines-day-2057745_960_720.jpg",
        ),
        urunKarti(
          "Karışık Kurabiye",
          "20 TL",
          "https://cdn.pixabay.com/photo/2016/11/17/17/37/cookie-1832169_960_720.jpg",
        ),
        urunKarti(
          "Çilekli Kek",
          "15 TL",
          "https://cdn.pixabay.com/photo/2014/05/23/23/17/dessert-352475_960_720.jpg",
        ),
        urunKarti(
          "Pasta",
          "16 TL",
          "https://cdn.pixabay.com/photo/2016/03/27/22/38/cake-1284548_960_720.jpg",
        ),
      ];
    } else if (widget.kategori == "içecekler") {
      gosterilecekListe = [
        urunKarti(
          "Portakal Suyu",
          "6.50 TL",
          "https://cdn.pixabay.com/photo/2017/05/21/16/52/juice-2331722_960_720.jpg",
        ),
        urunKarti(
          "Şişe Su",
          "2 TL",
          "https://cdn.pixabay.com/photo/2017/02/02/15/15/bottle-2032980_960_720.jpg",
        ),
        urunKarti(
          "Maden Suyu 6'lı",
          "5 TL",
          "https://cdn.pixabay.com/photo/2017/08/27/17/43/water-glass-2686973_960_720.jpg",
        ),
        urunKarti(
          "Gazoz",
          "1.50 TL",
          "https://cdn.pixabay.com/photo/2018/09/06/21/22/soda-3659387_960_720.jpg",
        ),
      ];
    } else if (widget.kategori == "temizlik") {
      gosterilecekListe = [
        urunKarti(
          "Bulaşık Deterjanı",
          "12 TL",
          "https://cdn.pixabay.com/photo/2020/05/08/15/31/detergent-5146192_960_720.jpg",
        ),
        urunKarti(
          "Sıvı Sabun",
          "9 TL",
          "https://cdn.pixabay.com/photo/2015/02/28/15/42/soap-653683_960_720.jpg",
        ),
      ];
    }
  }

  Widget urunKarti(String isim, String fiyat, String resimYolu,
      {bool mevcut = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UrunDetay(
                      isim: isim,
                      fiyat: fiyat,
                      resimYolu: resimYolu,
                      mevcut: mevcut,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: resimYolu,
              child: Container(
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(resimYolu), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              isim,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Text(fiyat,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 1,
      children: gosterilecekListe,
    );
  }
}
