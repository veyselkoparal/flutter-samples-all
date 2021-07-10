import 'package:flutter/material.dart';
import 'package:legacy_buttons/legacy_buttons.dart';

class HealtyFoodView extends StatefulWidget {
  @override
  _HealtyFoodViewState createState() => _HealtyFoodViewState();
}

class _HealtyFoodViewState extends State<HealtyFoodView> {
  List<String> categories = [
    "Breakfast",
    "Launch",
    "Breakfast",
    "Launch",
    "Breakfast",
    "Launch"
  ];

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: a1(),
      body: b2(),
      bottomNavigationBar: bars(),
    );
  }

  PageView buildPageView() {
    return PageView(
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
      ],
    );
  }

  Column b2() {
    return Column(
      children: [
        b1(),
        cards,
        sizedBoxEmpty(),
        categoryTitle(),
        sizedBoxEmpty(),
        sizedBoxCategories(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Dismissible(
              key: Key(index.toString()),
              child: Card(
                child: Container(
                    height: 100, child: Center(child: Text(index.toString()))),
              ),
            ),
          ),
        )
      ],
    );
  }

  SizedBox sizedBoxCategories() {
    return SizedBox(
      height: 100,
      child: listViewCategories(),
    );
  }

  ListView listViewCategories() {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => sizedBoxCategoriesCard(index),
    );
  }

  SizedBox sizedBoxCategoriesCard(int index) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          CircleAvatar(child: Icon(Icons.ac_unit)),
          Text(categories[index]),
        ],
      ),
    );
  }

  SizedBox sizedBoxEmpty() => SizedBox(height: 20);

  Text categoryTitle() =>
      Text("Categoires", style: Theme.of(context).textTheme.headline6);

  SizedBox get cards {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: cardListView(),
    );
  }

  ListView cardListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: containerCard(context),
      ),
    );
  }

  Container containerCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          expandedCardImage(),
          expandedCardDetail(),
          rowCardLocationAndStar(),
        ],
      ),
    );
  }

  Row rowCardLocationAndStar() {
    return Row(
      children: [
        Text("data"),
        Icon(Icons.star),
        Spacer(),
        Text("data"),
        Icon(Icons.star),
      ],
    );
  }

  Expanded expandedCardDetail() {
    return Expanded(
        flex: 2,
        child: ListTile(
          title: Text("sadasd"),
          trailing: CircleAvatar(child: Text("\$25")),
          subtitle: Text("data"),
        ));
  }

  Expanded expandedCardImage() => Expanded(flex: 6, child: Placeholder());

  Row b1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LegacyRaisedButton(
          shape: StadiumBorder(),
          onPressed: () => setColorIndex(0),
          color: buildCategoryButtonColor(0),
          child: Text("Hello"),
        ),
        LegacyRaisedButton(
          shape: StadiumBorder(),
          onPressed: () => setColorIndex(1),
          color: buildCategoryButtonColor(1),
          child: Text("Hello"),
        ),
        LegacyRaisedButton(
          shape: StadiumBorder(),
          child: Text("Hello"),
          color: buildCategoryButtonColor(2),
          onPressed: () => setColorIndex(2),
        ),
      ],
    );
  }

  void setColorIndex(int index) {
    setState(() {
      count = index;
    });
  }

  Color buildCategoryButtonColor(int index) => count != index
      ? Theme.of(context).colorScheme.onError
      : Theme.of(context).colorScheme.primary;

  AppBar a1() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: text(),
        centerTitle: false,
        actions: [iconButton()],
      );

  IconButton iconButton() => IconButton(
      icon: Icon(Icons.search, color: Colors.black), onPressed: () {});

  Text text() => Text("Hello", style: Theme.of(context).textTheme.headline6);

  BottomNavigationBar bars() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: "data"),
      BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: "data"),
    ]);
  }
}
