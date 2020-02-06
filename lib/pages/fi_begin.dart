/*
Date: 28 January 2020
Title: fi_begin.dart
Description: This file displays the FI collection module. This file is able to capture clients image, save his current location, and navigate to FI form.
Developer: Ashish Verma
*/

import 'package:flutter/material.dart';
import 'package:ne_first_look/pages/fi.dart';
import 'package:ne_first_look/pages/fi2.dart';
import 'package:ne_first_look/services/call_locator.dart';
import 'package:ne_first_look/services/call_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class FI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: FIPage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FIPage extends StatefulWidget {
  @override
  State createState() => FIPageState();
}

class FIPageState extends State<FIPage> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  String number = "9483033085";
  String upload = "Upload";
  String locate = "Save Current Location";
  var currentLocation;
  var location = new Location();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _fiHead(),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width,
              //padding: const EdgeInsets.fromLTRB(200.0, 200, 200, 270),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/capture.png',
                          fit: BoxFit.scaleDown,
                          scale: 2.0,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text('Capture Image',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Colors.grey)),
                            FlatButton(
                              child: Text(upload,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22.0,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue)),
                              onPressed: () async {
                                var picture = await ImagePicker.pickImage(
                                  source: ImageSource.camera,
                                );
                                if (picture != null) {
                                  setState(() {
                                    upload = "Uploaded";
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 5.0,),
                        Image.asset(
                          'assets/location.jpg',
                          fit: BoxFit.scaleDown,
                          scale: 10.0,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text('Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Colors.grey)),
                            FlatButton(
                              child: Text(locate,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22.0,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue)),
                              onPressed: () async{
                                try {
                                  currentLocation = await location.getLocation();
                                } on PlatformException catch (e) {
                                  if (e.code == 'PERMISSION_DENIED') {
                                    String error = 'Permission denied';
                                  }
                                  currentLocation = null;
                                }
                                if(currentLocation!=null){
                                  setState(() {
                                    locate = "Location Saved";
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/fi.png',
                          fit: BoxFit.scaleDown,
                          scale: 10.0,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text('Field Investigation',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Colors.grey)),
                            FlatButton(
                              child: Text('Start FI',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22.0,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.blue)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new FI2()));
                              },
                            ),
                          ],
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

  Container _fiHead() {
    return Container(
      height: 340.0,
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 40.0),
      decoration: BoxDecoration(color: Colors.teal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("    Field Investigation",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0)),
          Center(
              child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30.0,
              ),
              CircleAvatar(
                radius: 60.0,
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
                child: Text('M: 9483033085',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                onTap: () {
                  _service.call(number);
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
