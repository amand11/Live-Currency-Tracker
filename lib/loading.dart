import 'package:currency_tracker/main.dart';
import 'package:flutter/material.dart';
import 'constraints.dart';
import 'package:http/http.dart';
import 'dart:convert';




class Loading extends StatefulWidget {
//  void curr() async {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void curr() async {
    Response response = await get('http://api.currencylayer.com/live?access_key=4fe2c9afde3fca72b5afcba04a80f019');
    Map as = jsonDecode(response.body)["quotes"];
    suc = jsonDecode(response.body)["success"];

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context)=> Homepage(map: as, suc: suc,),
    ));


  }
  Map an;
  bool suc = true;
  @override

  void initState() {
    // TODO: implement initState
    curr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Loading", style: TextStyle(fontSize: 70.0, color: Colors.redAccent),
        ),
      ),
    );
  }
}
