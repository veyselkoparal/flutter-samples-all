import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewKullanim extends StatelessWidget {
  //ListViewKullanim({Key? key}) : super(key: key);

  List<Ogrenciler> tumOgrenciler = List.generate(
      100,
      (index) => Ogrenciler(
          index, "Öğrenci Adı ${index + 1}", "Öğrenci Soyadı ${index + 1}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Gösterim"),
      ),
      body: listviewBuilderMetodu(),
    );
  }

  ListView listviewSeparatedMetodu() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        var aktifOgrenci = tumOgrenciler[index];
        return Card(
          color: index % 2 == 0 ? Colors.grey.shade200 : Colors.grey.shade100,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            onTap: () {
              print("eleman tıklandı: " + index.toString());
            },
            title: Text(aktifOgrenci.isim),
            subtitle: Text(aktifOgrenci.soyisim),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/09/02/13/24/girl-919048_960_720.jpg"),
                backgroundColor: Colors.transparent),
          ),
        );
      },
      itemCount: tumOgrenciler.length,
      //Separated listview listeye ekstra nesne eklemeye yarar
      separatorBuilder: (context, index) {
        var yeniIndex = index + 1;

        if (yeniIndex % 4 == 0) {
          return Divider(
            thickness: 2,
            color: Colors.blue,
          );
        }
        return SizedBox();
      },
    );
  }

  ListView listviewBuilderMetodu() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var aktifOgrenci = tumOgrenciler[index];
        return Card(
          color: index % 2 == 0 ? Colors.grey.shade200 : Colors.grey.shade100,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            onTap: () async {
              print("eleman tıklandı: " + index.toString());
              await Future.delayed(Duration(seconds: 1));
            },
            title: Text(aktifOgrenci.isim),
            subtitle: Text(aktifOgrenci.soyisim),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/09/02/13/24/girl-919048_960_720.jpg"),
                backgroundColor: Colors.transparent),
          ),
        );
      },
      itemCount: tumOgrenciler.length,
    );
  }

  ListView listViewMetodu() {
    return ListView(
      children: tumOgrenciler
          .map(
            (Ogrenciler ogr) => ListTile(
              title: Text(ogr.isim),
              subtitle: Text(ogr.soyisim),
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/09/02/13/24/girl-919048_960_720.jpg"),
                  backgroundColor: Colors.transparent),
            ),
          )
          .toList(),
    );
  }
}

class Ogrenciler {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenciler(this.id, this.isim, this.soyisim);
}
