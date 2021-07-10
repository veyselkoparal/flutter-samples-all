import 'package:flutter/material.dart';
import 'package:flutter_all_samples/samples/UI_1/main.dart';
import 'package:flutter_all_samples/samples/getX_sample_1/main.dart';
import 'samples/cardui_1/card.dart';
import 'samples/error_pages/main.dart';
import 'samples/fMarket/main.dart';
import 'samples/json_sample1/main.dart';
import 'samples/listview/main.dart';
import 'samples/signUp_page/main.dart';
import 'samples/sociaworld/main.dart';
import 'samples/url_launcher/main.dart';

List<Widget> screenList = [
  HataSayfalar(),
  ListViewPage(),
  CardUI1(),
  JsonSample1(),
  SignUpPage(),
  GetXSample1(),
  UI1(),
  SociaWorld(),
  FMarket(),
  OpenURL(),
];

List<String> titles = [
  "Error Page",
  "ListView Page",
  "Card UI 1",
  "Breaking Bad (Json)",
  "Signup Page",
  "GetX Sample 1",
  "UI_1",
  "SociaWorld",
  "FMarket UI",
  "Url Launcher",
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter All Samples',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Flutter All Samples',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: PageMenu(title: titles, liste: screenList),
      ),
    );
  }
}

class PageMenu extends StatelessWidget {
  final List<String> title;
  final List<Widget> liste;

  const PageMenu({
    Key? key,
    required this.title,
    required this.liste,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey.shade100,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              onTap: () {
                print("eleman tıklandı: " + index.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => liste[index]),
                );
              },
              title: Text(this.title[index]),
              trailing: Icon(Icons.chevron_right),
              //subtitle: Text("Hata sayfalarını içerir"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/google-play.png"),
                  backgroundColor: Colors.transparent),
            ),
          );
          //return screenList[index];
        });
  }
}
