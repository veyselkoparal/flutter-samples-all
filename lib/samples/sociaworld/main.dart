import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gonderikart.dart';
import 'profilsayfasi.dart';

void main() => runApp(SociaWorld());

class SociaWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          iconSize: 32.0,
          color: Colors.grey,
        ),
        title: Text(
          "Sociaworld",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        duyurular("Kamil Seni takip etti", "3 dk önce"),
                        duyurular("Selçuk Seni takip etti", "5 dk önce"),
                        duyurular("Ayşe Seni takip etti", "4 dk önce"),
                        duyurular("Jessi Seni takip etti", "1 dk önce"),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.notifications),
            iconSize: 32.0,
            color: Colors.purple.shade300,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 1.0,
              ),
            ]),
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profilKartiOlustur(
                    "selcuk_22",
                    "https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508_960_720.jpg",
                    "Selçuk YÖNTEM",
                    "https://cdn.pixabay.com/photo/2017/08/07/16/39/girl-2605526_960_720.jpg"),
                profilKartiOlustur(
                    "tom22994",
                    "https://cdn.pixabay.com/photo/2016/03/27/16/54/face-1283106_960_720.jpg",
                    "Tom Hardy",
                    "https://cdn.pixabay.com/photo/2021/06/27/17/50/redstart-6369564_960_720.jpg"),
                profilKartiOlustur(
                    "jessi223",
                    "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553_960_720.jpg",
                    "Jessica Montly",
                    "https://cdn.pixabay.com/photo/2021/06/24/07/29/cow-6360406_960_720.jpg"),
                profilKartiOlustur(
                    "kate02",
                    "https://cdn.pixabay.com/photo/2013/06/14/18/13/girl-139353_960_720.jpg",
                    "Kate Winslet",
                    "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553_960_720.jpg"),
                profilKartiOlustur(
                    "juli33",
                    "https://cdn.pixabay.com/photo/2014/09/25/22/14/profile-461076_960_720.jpg",
                    "Julia Maria",
                    "https://cdn.pixabay.com/photo/2021/06/24/07/29/cow-6360406_960_720.jpg"),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          GonderiKart(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2017/08/07/16/39/girl-2605526_960_720.jpg",
            isimSoyad: "Emma Watson",
            gecenSure: "1 saat önce",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2021/06/27/17/50/redstart-6369564_960_720.jpg",
            aciklama: "Sonbahar da güzel kuş türleri çıkıyor....",
          ),
          GonderiKart(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553_960_720.jpg",
            isimSoyad: "Jessica Tossy",
            gecenSure: "2 saat önce",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2021/06/24/07/29/cow-6360406_960_720.jpg",
            aciklama: "Kurban yaklaşıyor...",
          ),
          //GonderiKart()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple.shade300,
        child: Icon(Icons.add_a_photo, color: Colors.white),
      ),
    );
  }

  Padding duyurular(String mesaj, String sure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(sure),
        ],
      ),
    );
  }

  Widget profilKartiOlustur(
      String username, String img, String isimSoyad, String kapakResmi) {
    return Material(
      child: InkWell(
        onTap: () async {
          String donenVeri = await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProfilSayfasi(
                    profilResimLinki: img,
                    kullaniciAdi: username,
                    isimSoyad: isimSoyad,
                    kapakResimLinki: kapakResmi,
                  )));
          print(donenVeri);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: "UcanProfilResmi" + username,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          repeat: ImageRepeat.noRepeat,
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Text(username,
                  style: TextStyle(fontSize: 15.0, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
