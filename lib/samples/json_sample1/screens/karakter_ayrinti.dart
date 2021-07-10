import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_all_samples/samples/json_sample1/models/karakterler.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Ayrinti extends StatefulWidget {
  final int id;

  const Ayrinti({Key? key, required this.id}) : super(key: key);

  @override
  _AyrintiState createState() => _AyrintiState();
}

/*
  Spinkit paketi gerekli, id alarak başka sayfaya aktarım yaparken veri çekme işlemi gerçekleşiyor
  Sayfa veriden önce açıldığı için hata meydana getiriyor. Bunun için bool ile işlemi bekletmeniz gerekiyor.
*/

class _AyrintiState extends State<Ayrinti> {
  KarakterClass k = KarakterClass();
  bool yukleniyor = false;

  void getKarakterTekil() async {
    //print(widget.id);
    var url = Uri.parse('https://www.breakingbadapi.com/api/characters/' +
        widget.id.toString());
    Response res = await get(url);
    var data = await jsonDecode(res.body);

    setState(() {
      k.name = data[0]["name"];
      k.img = data[0]["img"];
      yukleniyor = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getKarakterTekil();
  }

  @override
  Widget build(BuildContext context) {
    return yukleniyor == false
        ? Scaffold(
            body: Center(
              child: SpinKitRotatingCircle(
                color: Colors.blue,
                size: 30.0,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    this.k.name,
                    textStyle:
                        TextStyle(fontSize: 20.0, fontFamily: 'Canterbury'),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Center(
                  child: Image(
                    image: NetworkImage(this.k.img),
                  ),
                ),
              ],
            ),
          );
  }
}
