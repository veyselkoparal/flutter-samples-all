import 'package:flutter/material.dart';
import 'controller/sayac_controller.dart';
import 'lang.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

void main() => runApp(GetXSample1());

class GetXSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      translations: Messages(),
      //Sistem dilini atar
      locale: Get.deviceLocale,
      //Bu da manuel atar ilk açılış
      //locale: Locale("tr", "TR"),
      fallbackLocale: Locale("en", "tr"),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  SayacController controller = Get.put(SayacController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: myColumn(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 1,
              onPressed: () {
                controller.arttir();
              },
              child: Icon(Icons.add)),
          FloatingActionButton(
              heroTag: 2,
              onPressed: () {
                controller.azalt();
              },
              child: Icon(Icons.remove)),
          FloatingActionButton(
              heroTag: 3,
              //foregroundColor: Get.isDarkMode ? Colors.amber : Colors.white,
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: Icon(Icons.three_mp)),
          FloatingActionButton(
              heroTag: 4,
              backgroundColor: Colors.amber,
              //foregroundColor: Get.isDarkMode ? Colors.amber : Colors.white,
              onPressed: () {
                Get.updateLocale(Locale("tr", "TR"));
              },
              child: Icon(Icons.language)),
          FloatingActionButton(
              heroTag: 4,
              backgroundColor: Colors.purple,
              //foregroundColor: Get.isDarkMode ? Colors.amber : Colors.white,
              onPressed: () {
                Get.updateLocale(Get.locale == Locale("tr", "TR")
                    ? Locale("en", "EN")
                    : Locale("tr", "TR"));
              },
              child: Icon(Icons.language_outlined)),
        ],
      ),
    );
  }

  Column myColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('hello'.tr, style: TextStyle(fontSize: 32)),
        Text('button_text'.tr, style: TextStyle(fontSize: 32)),
        GetX<SayacController>(
          builder: (controller2) => Text(
            controller2.sayac.toString(),
            style: TextStyle(fontSize: 32),
          ),
        ),
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Yeni Sayfa"),
          ),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Geri Dön")),
        ],
      ),
    );
  }
}
