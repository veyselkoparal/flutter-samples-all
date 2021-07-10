import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card List"),
        backgroundColor: Colors.amber.shade900,
      ),
      body: Center(
        child: listViewOzellikliCard(),
      ),
    );
  }

  ListView listViewOzellikliCard() {
    //ListView içinde gösterim
    return ListView(
      children: [
        Column(
          children: [
            cardListeEleman(),
            cardListeEleman(),
            cardListeEleman(),
            cardListeEleman(),
            cardListeEleman(),
            cardListeEleman(),
            cardListeEleman(),
            cardListeEleman(),
            cardListeEleman(),
          ],
        ),
      ],
    );
  }

  SingleChildScrollView scrollViewChildCard() {
    //ScrollView Özelliği veriyor
    return SingleChildScrollView(
      child: Column(
        children: [
          cardListeEleman(),
          cardListeEleman(),
          cardListeEleman(),
          cardListeEleman(),
          cardListeEleman(),
          cardListeEleman(),
          cardListeEleman(),
          cardListeEleman(),
          cardListeEleman(),
        ],
      ),
    );
  }

  Column cardListeEleman() {
    return Column(
      children: [
        Card(
          color: Colors.amber,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/09/02/13/24/girl-919048_960_720.jpg"),
                backgroundColor: Colors.transparent),
            title: Text("Başlık"),
            subtitle: Text("Alt Başlık"),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ],
    );
  }
}
