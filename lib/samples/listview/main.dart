import 'package:flutter/material.dart';
import 'listviewKullanim.dart';

void main() => runApp(ListViewPage());

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ListViewKullanim(),
    );
  }
}
