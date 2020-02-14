/*
Date: 25 January 2020
Title: user_details.dart
Description: This file displays the Collection module entry point with user's loan details.
Developer: Ashish Verma

Log
 1. Date: 7 Feb 2020, Desc: Adding Loan details to the page, Developer: Ashish Verma 
*/

import 'package:flutter/material.dart';
import 'package:ne_first_look/services/call_locator.dart';
import 'package:ne_first_look/services/call_service.dart';
import '../services/my_flutter_app_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:image_picker/image_picker.dart';

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

class EMIData {
  EMIData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color color;
}

class UserDetailState extends State<UserDetail> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  String number = "9483033085";
  String long = "13.089122";
  String lat = "77.484726";
  var transferDoc;
  String docUpload = "Upload Receipt";
  bool isCollectVisible = false;
  Icon icon = Icon(Icons.arrow_forward_ios);

  final List<ChartData> chartData = [
    ChartData('Late', 5000, Colors.teal[300]),
    ChartData('Last', 4000, Colors.cyan[400]),
    ChartData('Fixed', 20000, Colors.yellow[400])
  ];

  final List<EMIData> emiData = [
    EMIData('Jan', 12, Colors.teal),
    EMIData('Feb', 8, Colors.teal),
    EMIData('Mar', 11, Colors.teal),
    EMIData('Apr', 7, Colors.teal),
    EMIData('May', 10, Colors.teal),
    EMIData('Jun', 7, Colors.teal),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _userHead(context),
            Container(
              //color: Colors.white,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Container(
                        alignment: Alignment(0.0, 0.0),
                        constraints: BoxConstraints(
                            maxHeight: 300,
                            maxWidth: 250.0,
                            minWidth: 150.0,
                            minHeight: 150.0),
                        child: SfCircularChart(
                            annotations: <CircularChartAnnotation>[
                              CircularChartAnnotation(
                                  child: Container(
                                      child: Text('29000',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold))))
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
                    height: 20.0,
                  ),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                          maxHeight: 150,
                          maxWidth: MediaQuery.of(context).size.width,
                          minWidth: 150.0,
                          minHeight: 80.0),
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          placeLabelsNearAxisLine: false,
                          labelPosition: LabelPosition.outside,
                          majorTickLines: MajorTickLines(size: 0),
                          axisLine: AxisLine(width: 0, color: Colors.grey[200]),
                          isVisible: true,
                          majorGridLines: MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 1,
                          maximum: 15,
                          isVisible: false,
                          labelFormat: '{value}D',
                        ),
                        tooltipBehavior: TooltipBehavior(
                            enable: true, header: '', canShowMarker: false),
                        series: <ColumnSeries>[
                          ColumnSeries<EMIData, String>(
                            dataSource: emiData,
                            xValueMapper: (EMIData data, _) => data.x,
                            yValueMapper: (EMIData data, _) => data.y,
                            pointColorMapper: (EMIData data, _) => data.color,
                            gradient: LinearGradient(colors: <Color>[
                              Colors.teal[100],
                              Colors.teal[300],
                              Colors.teal[400]
                            ]),
                            dataLabelSettings:
                                DataLabelSettings(isVisible: false),
                            borderRadius: BorderRadius.circular(25.0),
                            width: 0.42,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: _dashTile(
                                icon: Icons.schedule,
                                title: "Tenure",
                                data: "60"),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: _dashTile(
                                icon: Icons.calendar_today,
                                title: "Current Month",
                                data: "15"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: _dashTile(
                                icon: Icons.timelapse,
                                title: "Total Outstanding",
                                data: "1,56,000"),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: _dashTile(
                                icon: Icons.portrait,
                                title: "Loan Amount",
                                data: "4,00,000"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
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
                            icon: icon,
                            onPressed: () {
                              setState(() {
                                icon = Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 35.0,
                                );
                              });
                              _changeVisibility();
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Visibility(
                    visible: isCollectVisible,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new RaisedButton(
                              padding: const EdgeInsets.all(16.0),
                              textColor: Colors.white,
                              color: Colors.teal[300],
                              child: Center(child: Text('Cash')),
                              onPressed: () {
                                _collectionWidget(1);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                            ),
                            new RaisedButton(
                              padding: const EdgeInsets.all(16.0),
                              textColor: Colors.white,
                              color: Colors.teal[300],
                              child: Center(child: Text('Cheque')),
                              onPressed: () {
                                _collectionWidget(2);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                            ),
                            new RaisedButton(
                              padding: const EdgeInsets.all(16.0),
                              textColor: Colors.white,
                              color: Colors.teal[300],
                              child: Center(child: Text('Transfer')),
                              onPressed: () {
                                _collectionWidget(3);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
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

  void _changeVisibility() {
    setState(() {
      isCollectVisible = !isCollectVisible;
    });
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

  Future<void> _collectionWidget(int id) {
    if (id == 1) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Card(
              margin: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 100.0),
              child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Cash",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: "Amount",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Cash",
                            prefixIcon: new Icon(Icons.attach_money)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      new RaisedButton(
                        padding: const EdgeInsets.all(16.0),
                        textColor: Colors.white,
                        color: Colors.teal[300],
                        child: Center(child: Text('Collect')),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                      ),
                    ],
                  )),
            );
          });
    }

    if (id == 2) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Card(
              margin: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 100.0),
              child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Cheque",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: "Amount",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Cheque",
                            prefixIcon: new Icon(Icons.attach_money)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: "Cheque Nmber",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Cheque",
                            prefixIcon: new Icon(Icons.attach_money)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      new RaisedButton(
                        padding: const EdgeInsets.all(16.0),
                        textColor: Colors.white,
                        color: Colors.teal[300],
                        child: Center(child: Text('Collect')),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                      ),
                    ],
                  )),
            );
          });
    }

    if (id == 3) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Card(
              margin: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 100.0),
              child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Transfer",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: "Amount",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Transfer",
                            prefixIcon: new Icon(Icons.attach_money)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: <Widget>[
                          new RaisedButton(
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.teal[300],
                            textColor: Colors.white,
                            child: new Text('Upload'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            onPressed: () {
                              uploadImage();
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(docUpload,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.teal[300])),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      new RaisedButton(
                        padding: const EdgeInsets.all(16.0),
                        textColor: Colors.white,
                        color: Colors.teal[300],
                        child: Center(child: Text('Collect')),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                      ),
                    ],
                  )),
            );
          });
    }
  }

  void uploadImage() async {
    transferDoc = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (transferDoc != null) {
      setState(() {
        docUpload = "Document Uploaded.";
      });
    }
  }

  Card _dashTile({IconData icon, String title, String data}) {
    return Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.teal,
            ),
            Text(title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            Text(
              data,
              style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )
          ],
        ),
      ),
    );
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
