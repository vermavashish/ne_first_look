/*
Date:3 February 2020
Title: fi.dart
Description: This file displays the field investigation questions and reports back to the server.
Developer: Ashish Verma
*/

import 'package:flutter/material.dart';

class FIList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: PendingFIList2(),
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PendingFIList2 extends StatefulWidget {
  @override
  State createState() => PendingFIListState2();
}

class PendingFIListState2 extends State<PendingFIList2> {
  Color color = Colors.white;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Field Investigation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              questionForm("1. Is Residence Owned by Borrower?"),
              Row(
                children: <Widget>[
                  optionCard(color, "YES"),
                  SizedBox(
                    width: 35.0,
                  ),
                  optionCard(color, "NO"),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("2. What is expected cost of the House?"),
              const SizedBox(
                height: 10.0,
              ),
              textField(),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("3. How is living Standard of the Borrower?"),
              Row(
                children: <Widget>[
                  optionCard(color, "GOOD"),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "AVERAGE"),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "POOR"),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("4. Is address in Negative Area?"),
              Row(
                children: <Widget>[
                  optionCard(color, "YES"),
                  SizedBox(
                    width: 35.0,
                  ),
                  optionCard(color, "NO"),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("5. Mention the Landline Number Available"),
              const SizedBox(
                height: 10.0,
              ),
              textField(),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("6. Write the mobile number of a Family Member"),
              const SizedBox(
                height: 10.0,
              ),
              textField(),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: check,
                    onChanged: (bool val){
                      setState(() {
                        check=val;
                      });
                    },
                  ),
                  //const SizedBox(width: 5.0,),
                  Text("Have Checked the mentioned office and residence number during the FI",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget optionCard(Color col, String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 65.0,
      width: 117.0,
      child: InkWell(
        onTap: () {
          setState(() {
            color = Colors.teal;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          )),
          elevation: 10.0,
          color: color,
        ),
      ),
    );
  }

  Widget questionForm(String text) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 27.0, color: Colors.black),
    );
  }

  Widget textField() {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: new BorderSide(color: Colors.teal)),
          hintStyle: TextStyle(color: Colors.black),
          labelText: "Answer",
          prefixIcon: new Icon(Icons.question_answer)),
    );
  }
}
