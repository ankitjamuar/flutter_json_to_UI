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
      title: "Cryptocurrency",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF242E56),
          elevation: 0,
          title: Center(
            child: Text("Wallet", style: TextStyle(fontFamily: "Lato")),
          ),
        ),
        backgroundColor: Color(0xFF242E56),
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
                            margin: EdgeInsets.only(top: 286),
                            padding: EdgeInsets.only(
                              top: 25,
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
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(snapshot
                                                      .data.imageUrl !=
                                                  null
                                              ? snapshot.data.imageUrl
                                              : "https://st2.depositphotos.com/3369547/11378/v/950/depositphotos_113787590-stock-illustration-man-design-male-avatar-icon.jpg"),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data.name != null
                                                      ? snapshot.data.name
                                                      : "<COIN NAME>",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff242E56)),
                                                ),
                                                SizedBox(width: 5),
                                                Icon(
                                                  Icons.arrow_upward_rounded,
                                                  color: Colors.green,
                                                )
                                              ],
                                            ),
                                            Text(
                                              snapshot.data.name != null
                                                  ? snapshot.data.value.price
                                                  : "<COIN VALUE>",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 110),
                                        Column(
                                          children: [
                                            Text(
                                              "730.64",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xff242E56)),
                                            ),
                                            Text(
                                              "2.57 %",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data.value.price !=
                                                null
                                                ? snapshot.data.value.price
                                                : "<PRICE>"),
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.arrow_circle_down_sharp,
                                              color: Colors.red,
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Market Cap: ",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey
                                         ),
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data.value.marketCap !=
                                                    null
                                                ? snapshot.data.value.marketCap
                                                : "<PRICE>"),
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.arrow_circle_down_sharp,
                                              color: Colors.red,
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("All time high ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data.value.allTimeHigh !=
                                                null
                                                ? snapshot.data.value.allTimeHigh
                                                : "<PRICE>"),
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.arrow_circle_up_rounded,
                                              color: Colors.green,
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    Image.asset("assets/graph.png"),
                                    SizedBox(height: 15),
                                    Container(
                                      width: 500,
                                        color: Colors.white,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF242E56),
                                            ),
                                            onPressed: () {
                                              coins =
                                                  ProductService.getProducts();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Text("NEXT"),
                                            ))),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, left: 130),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(snapshot
                                                .data.imageUrl !=
                                            null
                                        ? snapshot.data.imageUrl
                                        : "https://st2.depositphotos.com/3369547/11378/v/950/depositphotos_113787590-stock-illustration-man-design-male-avatar-icon.jpg"),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    snapshot.data.name != null
                                        ? snapshot.data.name
                                        : "<COIN NAME>",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                        child: Text("Error fetching data ${snapshot.error} "));
                  }
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
