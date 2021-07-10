import 'package:flutter/material.dart';
import 'healthy_food_view.dart';

void main() => runApp(UI1());

class UI1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HealtyFoodView(),
    );
  }
}
