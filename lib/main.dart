import 'package:flutter/material.dart';
import 'package:food_order/DetaialsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Splash(),
            debugShowCheckedModeBanner: false,
          );
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'Food Order',
            home: MyHomePage(title: ''),
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    // ---------- menu ----------

                  },
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  iconSize: 30,
                ),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          // ---------- search ----------

                        },
                        icon: Icon(Icons.search),
                        color: Colors.white,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          // ---------- cart -----------

                        },
                        icon: Icon(Icons.shopping_cart_outlined),
                        color: Colors.white,
                        iconSize: 30,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Text(
                  'Restaurant',
                  style: TextStyle(
                    fontFamily: 'MonteCarlo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Food',
                  style: TextStyle(
                    fontFamily: 'MonteCarlo',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 105,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25, right: 25),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: ListView(
                      children: <Widget>[

                        _buildFoodItem(
                            'assets/png.png', "Diet meal", "\$ 50.00"),
                        _buildFoodItem(
                            'assets/png 2.png', "Humburger", "\$ 30.00"),
                        _buildFoodItem(
                            'assets/png 3.png', "Humburger", "\$ 40.00"),
                        _buildFoodItem(
                            'assets/png 4.png', "Humburger", "\$ 20.00"),
                        _buildFoodItem(
                            'assets/png 4.png', "Humburger", "\$ 20.00"),
                        _buildFoodItem(
                            'assets/png 4.png', "Humburger", "\$ 20.00"),
                        _buildFoodItem(
                            'assets/png 4.png', "Humburger", "\$ 20.00")
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(imgPath, foodName, price)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        foodName,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(imgPath, foodName, price)));
              },
              icon: Icon(Icons.add),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Center(
        child: Hero(
            tag: '',
            child: Image(
              image: AssetImage('assets/dlivery.png'),
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            )),
      ),
    );
  }
}
