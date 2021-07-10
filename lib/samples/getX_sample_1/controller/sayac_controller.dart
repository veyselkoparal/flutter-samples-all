import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SayacController extends GetxController {
  var _sayac = 0.obs;

  //Bunlarla aşağıdaki aynı şey get/set
  //int sayacDegeriniVer() => _sayac.value;
  //void yeniSayacDegeriAta(yeniDeger) => _sayac.value = yeniDeger;

  //Get-Set
  get sayac => _sayac.value;
  set sayac(yeniDeger) => _sayac.value = yeniDeger;

  void arttir() {
    sayac++;
    Get.snackbar("Snackbar", _sayac.toString(),
        backgroundColor: Colors.amber, duration: Duration(seconds: 2));
  }

  void azalt() {
    sayac--;
    Get.snackbar("Snackbar", _sayac.toString(),
        backgroundColor: Colors.purple,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.add));
  }
}
