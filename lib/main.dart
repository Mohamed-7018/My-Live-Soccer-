import 'package:flutter/material.dart';
import 'package:soccer/animation.dart';
import 'package:soccer/api_manager.dart';
import 'package:soccer/navigation_home_screen.dart';
import 'package:soccer/pagebody.dart';
//import 'package:soccer/screens/onboard/onboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationHomeScreen(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.black,
        //Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "My life Soccerboard",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                MyApp();
              });
              },
            icon: Icon(Icons.refresh),
          )
        ],

      ),

      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
//      body:Onboard() ,
      body: FutureBuilder(
        future: SoccerApi()
            .getAllMatches(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            print((snapshot.data).length);
            return PageBody(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}
