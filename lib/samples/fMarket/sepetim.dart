import 'package:flutter/material.dart';

class Sepetim extends StatelessWidget {
  const Sepetim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            "Sepetim",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade400,
            ),
          ),
        ),
        ListTile(
          title: Text("Çikolotalı Gofret"),
          subtitle: Text("2 adet x 3.50 TL"),
          trailing: Text("29 TL"),
        ),
        ListTile(
          title: Text("Meyve Suyu"),
          subtitle: Text("1 adet x 3.50 TL"),
          trailing: Text("12 TL"),
        ),
        ListTile(
          title: Text("Islak Kek"),
          subtitle: Text("5 adet x 3.50 TL"),
          trailing: Text("9 TL"),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Column(
                children: [
                  Text(
                    "Toplam Tutar",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade400,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "50 TL",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red.shade400,
            ),
            child: Center(
              child: Text(
                "Alışverişi Tamamla",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
