import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService{
  static Future<String> getProducts() async {
    var products = await http.get( Uri.parse("https://raw.githubusercontent.com/ankitjamuar/flutter_json_to_UI/master/lib/services/products.json"));
    return json.decode(products.body);
  }
}