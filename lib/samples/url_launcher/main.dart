import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(OpenURL());

// ignore: must_be_immutable
class OpenURL extends StatelessWidget {
  String url = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    url =
                        "mailto:veyselkoparal@gmail.com?subject=Yeni%20Konu&body=Icerik%20Body";
                    launchURL(url);
                  },
                  child: Text("Mail Gönder"),
                ),
                ElevatedButton(
                  onPressed: () {
                    url = "sms:05454158245";
                    launchURL(url);
                  },
                  child: Text("SMS Gönder"),
                ),
                ElevatedButton(
                  onPressed: () {
                    url = "tel:+905454158245";
                    launchURL(url);
                  },
                  child: Text("Arama Yap"),
                ),
                ElevatedButton(
                  onPressed: () {
                    url = "https://flutter.dev";
                    launchURL(url);
                  },
                  child: Text("Web Tarayıcı"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}
