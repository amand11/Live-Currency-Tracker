import 'package:flutter/material.dart';
import 'constraints.dart';
import 'package:http/http.dart';
import 'mybox.dart';
import 'loading.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(),
    home: Loading(),
  ));
}

class Homepage extends StatefulWidget {
  final Map map;
  final bool suc;
  Homepage({this.map, this.suc});
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedCurrency = "USD";
  String boxCurrency1 = "AUD";
  String boxCurrency2 = "INR";
  String boxCurrency3 = "EUR";
  String boxCurrency4 = "HKD";
  double val = 1;
  String val1 = "73.23";
  String val2 = "4.37";
  String val3 = "0.33";
  String val4 = "72.31";
  List <DropdownMenuItem<String>> addDrp(){
    List <DropdownMenuItem<String>> dropitm = [];
    for(String St in currenciesList){
      var as = DropdownMenuItem(child: Text(St), value: St,);
      dropitm.add(as);
    }
    return dropitm;
  }

  void curr() async {
    //Future <Map> curr() async {
//    Response response = await get('http://api.currencylayer.com/live?access_key=4fe2c9afde3fca72b5afcba04a80f019');
    Map as = widget.map;
    bool suc = widget.suc;
//    print(as);
    String cur = as["USD"+selectedCurrency].toStringAsFixed(2);
    double doli = as["USD"+selectedCurrency].toDouble();
    String cur1 = ((as["USD"+boxCurrency1]/doli)*val).toStringAsFixed(2);
    String cur2 = ((as["USD"+boxCurrency2]/doli)*val).toStringAsFixed(2);
    String cur3 = ((as["USD"+boxCurrency3]/doli)*val).toStringAsFixed(2);
    String cur4 = ((as["USD"+boxCurrency4]/doli)*val).toStringAsFixed(2);
    print("$cur $cur1 $cur2 $cur3 $cur4");
    setState(() {
      val1 = cur1; val2 = cur2; val3 = cur3; val4 = cur4;
    });
    //return as;
  }

  @override
  void initState() {
    curr();
    //mymap = curr();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Tracker'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                fillColor: Colors.black12,
                hintText: "1",
                suffixText: selectedCurrency,
                icon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.deepOrange)),
                filled: true,
              ),
              style: TextStyle(color: Colors.black, ),
              onChanged: (value){
                setState(() {
                  val =  double.parse(value);
                  double doli = widget.map["USD"+selectedCurrency].toDouble();
                  doli = doli/val;
                  val1 = (widget.map["USD"+boxCurrency1]/doli).toStringAsFixed(2);
                  val2 = (widget.map["USD"+boxCurrency2]/doli).toStringAsFixed(2);
                  val3 = (widget.map["USD"+boxCurrency3]/doli).toStringAsFixed(2);
                  val4= (widget.map["USD"+boxCurrency4]/doli).toStringAsFixed(2);
                });

              },
            ),
          ),
          Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: MyBox(boxCurrency: boxCurrency1, selectedCurrency: selectedCurrency, val: val1,
                        child: DropdownButton <String> (
                          value: boxCurrency1,
                          items: addDrp(),
                          onChanged: (value){
                            setState(() {
                              boxCurrency1 = value;
                              double doli = widget.map["USD"+selectedCurrency].toDouble();
                              doli = doli/val;
                              val1 = (widget.map["USD"+boxCurrency1]/doli).toStringAsFixed(2);
                            });
                          },
                        ),
                      )
                  ),
                  Expanded(
                      child: MyBox(boxCurrency: boxCurrency2, selectedCurrency: selectedCurrency, val: val2,
                        child: DropdownButton <String> (
                          value: boxCurrency2,
                          items: addDrp(),
                          onChanged: (value){
                            setState(() {
                              boxCurrency2 = value;
                              double doli = widget.map["USD"+selectedCurrency].toDouble();
                              doli = doli/val;
                              val2 = (widget.map["USD"+boxCurrency2]/doli).toStringAsFixed(2);
                            });
                          },
                        ),
                      )
                  ),
                ],
              )
          ),
          Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: MyBox(boxCurrency: boxCurrency3, selectedCurrency: selectedCurrency, val: val3,
                        child: DropdownButton <String> (
                          value: boxCurrency3,
                          items: addDrp(),
                          onChanged: (value){
                            setState(() {
                              boxCurrency3 = value;
                              double doli = widget.map["USD"+selectedCurrency].toDouble();
                              doli = doli/val;
                              val3 = (widget.map["USD"+boxCurrency3]/doli).toStringAsFixed(2);
                            });
                          },
                        ),
                      )
                  ),
                  Expanded(
                      child: MyBox(boxCurrency: boxCurrency4, selectedCurrency: selectedCurrency, val: val4,
                        child: DropdownButton <String> (
                          value: boxCurrency4,
                          items: addDrp(),
                          onChanged: (value){
                            setState(() {
                              boxCurrency4 = value;
                              double doli = widget.map["USD"+selectedCurrency].toDouble();
                              doli = doli/val;
                              val4 = (widget.map["USD"+boxCurrency4]/doli).toStringAsFixed(2);
                            });
                          },
                        ),
                      )
                  ),
                ],
              )
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12,
                  ),
                  padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
                  margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
                  child: DropdownButton <String> (
                    value: selectedCurrency,
                    items: addDrp(),
                    onChanged: (value){
                      setState(() {
                        selectedCurrency = value;
                        double doli = widget.map["USD"+selectedCurrency].toDouble();
                        doli = doli/val;
                        val1 = (widget.map["USD"+boxCurrency1]/doli).toStringAsFixed(2);
                        val2 = (widget.map["USD"+boxCurrency2]/doli).toStringAsFixed(2);
                        val3 = (widget.map["USD"+boxCurrency3]/doli).toStringAsFixed(2);
                        val4= (widget.map["USD"+boxCurrency4]/doli).toStringAsFixed(2);
                      });
                    },
                  ),
                ),
              ]
          )
        ],
      ),
    );
  }
}


// conduction