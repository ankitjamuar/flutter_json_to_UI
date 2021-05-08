import 'dart:convert';

import 'package:flutter_json_app/Models/Coins.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<Coins> getProducts() async {
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/ankitjamuar/flutter_json_to_UI/master/lib/services/products.json"));
    print(json.decode(response.body));
    return response.statusCode == 200 ?
    Coins.fromJson(json.decode(response.body)) : Exception(
        "Failed to get data");
    // final body = json.decode(response.body);
    // return  body.map(Coins.fromJson);
  }
}