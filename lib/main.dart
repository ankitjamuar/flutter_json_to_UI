import 'package:flutter/material.dart';
import 'package:flutter_json_app/services/product_service.dart';

import 'Models/Coins.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Coins> coins;

  @override
  void initState() {
    super.initState();

    coins = ProductService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder<Coins>(
                future: coins,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 1500,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 386),
                            padding: EdgeInsets.only(
                              top: 55,
                              left: 20,
                              right: 20,
                            ),
                            // height: 500,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Center(
                                    child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          snapshot.data.name != null
                                              ? snapshot.data.name
                                              : "<COIN NAME>",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.favorite_border_rounded)
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(snapshot.data.description != null
                                            ? snapshot.data.description
                                            : "<Description of the Coin>"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text("Price: "),
                                        Text(snapshot.data.value.price != null
                                            ? snapshot.data.value.price
                                            : "<PRICE>"),
                                        Icon(
                                          Icons.arrow_upward_rounded,
                                          color: Colors.green,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("Market Cap: "),
                                        Text(snapshot.data.value.marketCap !=
                                                null
                                            ? snapshot.data.value.marketCap
                                            : "<PRICE>"),
                                        Icon(
                                          Icons.arrow_circle_down_sharp,
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("All Time High: "),
                                        Text(snapshot.data.value.allTimeHigh !=
                                                null
                                            ? snapshot.data.value.allTimeHigh
                                            : "<PRICE>"),
                                      ],
                                    ),
                                    Image.asset("assets/graph.png")
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 120, left: 130),
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(
                                    snapshot.data.imageUrl != null ? snapshot.data.imageUrl:
                                    "https://st2.depositphotos.com/3369547/11378/v/950/depositphotos_113787590-stock-illustration-man-design-male-avatar-icon.jpg"),
                              )),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error fetching data"));
                  }
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            color: Colors.white,
            child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("NEXT"),
                ))),
      ),
    );
  }
}
