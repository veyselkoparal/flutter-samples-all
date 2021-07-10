import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_all_samples/samples/json_sample1/models/karakterler.dart';
import 'package:flutter_all_samples/samples/json_sample1/screens/karakter_ayrinti.dart';
import 'package:http/http.dart' as http;

class KarakterlerView extends StatefulWidget {
  const KarakterlerView({Key? key}) : super(key: key);

  @override
  _KarakterlerViewState createState() => _KarakterlerViewState();
}

class _KarakterlerViewState extends State<KarakterlerView> {
  List<KarakterClass> karakterDizisi = [];

  void getKarakterler() async {
    var url = Uri.parse('https://www.breakingbadapi.com/api/characters');
    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    //print(data);

    setState(() {
      for (int i = 0; i < data.length; i++) {
        KarakterClass k = KarakterClass();
        k.charId = data[i]["char_id"];
        k.name = data[i]["name"];
        k.img = data[i]["img"];
        karakterDizisi.add(k);
      }
    });

  }

  @override
  void initState() {
    super.initState();
    getKarakterler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breaking Bad Api"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: karakterDizisi.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            Ayrinti(id: karakterDizisi[index].charId)));
              },
              child: ListTile(
                title: Text(
                  karakterDizisi[index].name,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 18.0),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(karakterDizisi[index].img),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
