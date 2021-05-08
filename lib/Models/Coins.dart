// To parse this JSON data, do
// https://app.quicktype.io
//     final coins = coinsFromJson(jsonString);

import 'dart:convert';

List<Coins> coinsFromJson(String str) => List<Coins>.from(json.decode(str).map((x) => Coins.fromJson(x)));

String coinsToJson(List<Coins> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coins {
  Coins({
    this.name,
    this.description,
    this.imageUrl,
    this.value,
  });

  String name;
  String description;
  String imageUrl;
  Value value;

  factory Coins.fromJson(Map<String, dynamic> json) => Coins(
    name: json["name"],
    description: json["description"],
    imageUrl: json["image_url"],
    value: Value.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "image_url": imageUrl,
    "value": value.toJson(),
  };
}

class Value {
  Value({
    this.price,
    this.marketCap,
    this.allTimeHigh,
  });

  String price;
  String marketCap;
  String allTimeHigh;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    price: json["price"],
    marketCap: json["market_cap"],
    allTimeHigh: json["all_time_high"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "market_cap": marketCap,
    "all_time_high": allTimeHigh,
  };
}
