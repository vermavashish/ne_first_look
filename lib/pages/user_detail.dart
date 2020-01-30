import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ne_first_look/services/call_locator.dart';
import 'package:ne_first_look/services/call_service.dart';


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

class UserDetailState extends State<UserDetail> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  String number = "9483033085";
  String long = "13.089122";
  String lat = "77.484726";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _userHead(),
            Container(
              height: MediaQuery.of(context).size.height,
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
                    height: 10.0,
                  ),
                  Card(
                      elevation: 4.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      margin: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: Container(
                                alignment: Alignment.bottomCenter,
                                width: 45.0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                      width: 8.0,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Container(
                                      height: 25,
                                      width: 8.0,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 8.0,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 8.0,
                                      color: Colors.grey.shade300,
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("EMI"),
                              subtitle: Text("100365"),
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: ListTile(
                              leading: Container(
                                alignment: Alignment.bottomCenter,
                                width: 45.0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                      width: 8.0,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Container(
                                      height: 25,
                                      width: 8.0,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 8.0,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 8.0,
                                      color: Colors.grey.shade300,
                                    ),
                                  ],
                                ),
                              ),
                              title: Text("Total"),
                              subtitle: Text("52356842"),
                            ),
                          )
                        ],
                      )),
                      const SizedBox(height: 40.0,),
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: ListTile(
                          leading: Icon(Icons.call),
                          title: Text("Call",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                          trailing: new IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: (){
                              _service.call(number);
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
                          leading: Icon(Icons.location_on),
                          title: Text("Navigate",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                          trailing: new IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: (){
                              _service.openGmap(long, lat);
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
                            onPressed: (){Toast.show("Collect", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);},
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

  Container _userHead() {
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
          Text("User",
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
              Text('+91 9483022075',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
            ],
          )),
        ],
      ),
    );
  }
}
