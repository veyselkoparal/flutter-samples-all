import 'package:flutter/material.dart';
import 'kategori.dart';

class Urunler extends StatefulWidget {
  const Urunler({Key? key}) : super(key: key);

  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin {
  late TabController televizyonKontrolcusu;

  @override
  void initState() {
    super.initState();
    televizyonKontrolcusu = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: televizyonKontrolcusu,
            indicatorColor: Colors.red[400],
            labelColor: Colors.red[400],
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            tabs: [
              Tab(child: Text("Temel Gıda")),
              Tab(child: Text("Şekerleme")),
              Tab(child: Text("İçecekler")),
              Tab(child: Text("Temizlik")),
            ]),
        Expanded(
          child: TabBarView(
            controller: televizyonKontrolcusu,
            children: [
              Kategori(kategori: "temel gıda"),
              Kategori(kategori: "şekerleme"),
              Kategori(kategori: "içecekler"),
              Kategori(kategori: "temizlik"),
            ],
          ),
        ),
      ],
    );
  }
}
