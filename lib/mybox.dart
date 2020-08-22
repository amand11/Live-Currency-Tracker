import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final String selectedCurrency;
  final String val;
  final String boxCurrency;
  final Widget child;
  MyBox({this.selectedCurrency, this.val ,this.boxCurrency, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(selectedCurrency)
          ),
          SizedBox(height: 10.0,),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(val , style: TextStyle(
                fontSize: 30.0,
                color: Colors.redAccent,
              ),),
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            flex: 1,
            child: child,
          ),
        ],
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
    );
  }
}