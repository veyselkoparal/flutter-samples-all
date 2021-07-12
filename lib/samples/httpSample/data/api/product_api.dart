import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    var url = Uri.parse('http://elmawarid.com/flutter/http/products.php');
    return http.get(url);
  }

  static Future getProductsByCategoryId(int userId) {
    var url = Uri.parse(
        "http://elmawarid.com/flutter/http/products.php?userId=" +
            userId.toString());
    return http.get(url);
  }
}