import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;
  late Animation<double> translateAnimasyonDegerleri;
  late Animation<double> scaleAnimasyonDegerleri;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    translateAnimasyonDegerleri = Tween<double>(begin: 0.0, end: 25.0 ).animate(animasyonKontrol)

      ..addListener(() {
      setState(() {

      });
    });

    scaleAnimasyonDegerleri = Tween<double>(begin: 36.0, end: 50.0 ).animate(animasyonKontrol)

      ..addListener(() {
        setState(() {

        });
      });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animasyonKontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.wb_cloudy, color: Colors.white, size: 128,),
            Transform.translate(
                offset: Offset(0.0, translateAnimasyonDegerleri.value),
                child: Text("Hava Durumu", style: TextStyle(color: Colors.white, fontSize: scaleAnimasyonDegerleri.value))),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(onPressed: (){
                animasyonKontrol.repeat(reverse: true);
                },
                  child: Text("Başla", style: TextStyle(color: Colors.white, fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Colors.orange),

              ),
            )

          ],
        ),
      ),

    );
  }
}
