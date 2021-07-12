import 'dart:convert';

import 'package:flutter/material.dart';
import '../data/api/category_api.dart';
import '../data/api/product_api.dart';
import '../models/category.dart';
import '../models/products.dart';
import '../widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> category = [];
  List<Widget> categoryWidget = [];
  List<Product> products = [];
  @override
  void initState() {
    getCategoryFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: categoryWidget),
            ),
            ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategoryFromApi() {
    CategoryApi.getCategory().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.category =
            list.map((categories) => Category.fromJson(categories)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < category.length; i++) {
      categoryWidget.add(getCategoryWidget(category[i]));
    }
    return categoryWidget;
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
      onPressed: () {
        getProductsByCategoryId(category);
      },
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.blueGrey),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.lightGreenAccent)),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
