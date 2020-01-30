/*
Date:28 January 2020
Title: fi.dart
Description: This file displays the field investigation questions and reports back to the server.
Developer: Ashish Verma
*/

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:toast/toast.dart';
import 'fi_form_list.dart';

class FIForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: FormPage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  State createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final SwiperController _swiperController = SwiperController();
  final int _pageCount = 12;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.teal[100],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _bodySwiper(),
          const SizedBox(
            height: 50.0,
          ),
          _buildButton()
        ],
      )),
    );
  }

  Widget _bodySwiper() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width / 1.3,
      child: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: new Swiper(
          //loop: false,
          index: _currentIndex,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                //margin: const EdgeInsets.all(10.0),
                height: 10.0,
                width: 10.0,
                child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5.0,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "  Q${index + 1}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10.0,2.0,10.0,6.0),
                          child: Text(quest[index],
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 2.0,bottom: 0.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.grey,
                            ),
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )));
          },
          itemCount: _pageCount,
          onIndexChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          pagination: new SwiperPagination(
              builder: const DotSwiperPaginationBuilder(
                  size: 8.0, activeSize: 8.0, space: 4.0)),
          controller: _swiperController,
        ),
      ),
    );
  }

  Widget _buildButton() {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width / 1.3,
      height: 45.0,
      child: RaisedButton(
        onPressed: () {
          if (_currentIndex < _pageCount - 1)
            _swiperController.next();
          else {
            Toast.show("FI Report", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
        },
        child: Text(_currentIndex < _pageCount - 1 ? "Next" : "Finish", style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.normal),),
        color: Colors.teal[300],
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.teal)),
      ),
    );
  }
}
