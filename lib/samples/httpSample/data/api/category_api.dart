import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategory() {
    var url = Uri.parse('http://elmawarid.com/flutter/http/category.php');
    return http.get(url);
  }
}
