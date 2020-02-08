/*
Date: 25 January 2020
Title: user_details.dart
Description: This file displays the Collection module entry point with user's loan details.
Developer: Ashish Verma

Log
 1. Date: 7 Feb 2020, Desc: Adding Loan details to the page, Developer: Ashish Verma 
*/

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ne_first_look/services/call_locator.dart';
import 'package:ne_first_look/services/call_service.dart';
import '../services/my_flutter_app_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: UserDetail(),
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserDetail extends StatefulWidget {
  @override
  State createState() => UserDetailState();
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}

class UserDetailState extends State<UserDetail> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  String number = "9483033085";
  String long = "13.089122";
  String lat = "77.484726";
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Late', 3000, Colors.blue),
      ChartData('Last', 4000, Colors.pink),
      ChartData('Fixed', 22000, Colors.purple)
    ];

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _userHead(context),
            Container(
              //color: Colors.white,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              //padding: const EdgeInsets.fromLTRB(200.0, 200, 200, 270),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    elevation: 15.0,
                    color: Colors.white,
                    margin: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Container(
                        alignment: Alignment(0.0, 0.0),
                        constraints: BoxConstraints(
                            maxHeight: 300,
                            maxWidth: 250.0,
                            minWidth: 150.0,
                            minHeight: 150.0
                        ),
                        child: SfCircularChart(
                            annotations: <CircularChartAnnotation>[
                              CircularChartAnnotation(
                                child: Container(
                                  child: Text('29000', style: TextStyle(color: Colors.grey, fontSize: 25.0, fontWeight: FontWeight.bold))
                                )
                              )
                            ],
                            legend: Legend(isVisible: true),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <CircularSeries>[
                              DoughnutSeries<ChartData, String>(
                                  strokeWidth: 1.0,
                                  explode: true,
                                  explodeOffset: '10%',
                                  dataSource: chartData,
                                  pointColorMapper: (ChartData data, _) =>
                                      data.color,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("Navigate",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                          trailing: new IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              _optionsDialogBox();
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text("Collect",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                          trailing: new IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Toast.show("Collect", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM);
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Home'),
                    onTap: () {
                      _service.openGmap(long, lat);
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Office'),
                    onTap: () {
                      _service.openGmap(long, lat);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Container _userHead(BuildContext context) {
    return Container(
      height: 380.0,
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 40.0),
      decoration: BoxDecoration(
          /*borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),*/
          color: Colors.teal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Row(children: <Widget>[
            /*IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }),*/
            Text("  User",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0)),
          ])),
          Center(
              child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30.0,
              ),
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage("assets/user.png"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text('User Name',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0)),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  _service.call(number);
                },
                child: Text('M: +91 9483033085',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0)),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
