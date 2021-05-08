import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "<NAME OF THE COIN>",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(Icons.favorite_border_rounded)
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text("<Description of the Coin>"),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text("Price: "),
                                  Text("<PRICE>"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("Market Cap: "),
                                  Text("<PRICE>"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("All Time High: "),
                                  Text("<PRICE>"),
                                ],
                              ),
                              Image.asset("assets/graph.png")
                            ],
                          )),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 120, left: 130),
                        child: CircleAvatar(

                          radius: 80,
                          backgroundImage :NetworkImage("https://st2.depositphotos.com/3369547/11378/v/950/depositphotos_113787590-stock-illustration-man-design-male-avatar-icon.jpg"),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container( color:Colors.white, child: ElevatedButton(onPressed: (){}, child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text("NEXT"),
        ))),
      ),
    );
  }
}
