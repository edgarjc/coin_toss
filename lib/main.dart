import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Coin Toss Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //generates a new Random object
  final _random = new Random();

  //Array with the heads or tails image path
  var coinOptions = ['Heads', 'Tails'];

  //Empty Variable that gets initialized when the flip button is pressed
  var coin;

  void _flipCoin() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      //Randomly selects a number of 0 or 1 to select the images from the array
      this.coin = coinOptions[_random.nextInt(coinOptions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _flipCoin method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //Sets the background color
      backgroundColor: Colors.white,
      appBar: AppBar(
        //Sets App Bar color
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Visibility widget only shows a child widget, in this example the image
            //Only if the condition is true
            //It only shows image if the image variable is not empty
            Visibility(
              visible: coin != null,
              child: Image.asset("assets/images/$coin.jpeg"),
            ),
            Visibility(
              visible: coin != null,
              child: Text("$coin",style: TextStyle(fontSize: 25),),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      //Sets button color to red
                      primary: Colors.red),
                  onPressed: _flipCoin,
                  child: Text("Flip Coin"),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
