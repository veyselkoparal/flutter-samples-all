import 'package:flutter/material.dart';
import 'package:flutter_all_samples/samples/json_sample1/screens/karakterler.dart';

void main() => runApp(JsonSample1());

class JsonSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: KarakterlerView(),
    );
  }
}
