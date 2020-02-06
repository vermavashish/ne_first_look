/*
Date:3 February 2020
Title: fi.dart
Description: This file displays the field investigation questions and reports back to the server.
Developer: Ashish Verma
*/

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

int count = 0;

class FI2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: FIForm2(),
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FIForm2 extends StatefulWidget {
  @override
  State createState() => FIFormstate2();
}

class FIFormstate2 extends State<FIForm2> {
  bool check = false;
  bool address = false;
  Color color = Colors.white;
  String docUpload = "Attach valid address proof.";
  String closer = "Attach closer document";
  var closerPic;
  var picture;
  var gallery;
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
              questionForm("1. Is Residence Owned by Borrower?"),                           //Questtion 1
              Row(
                children: <Widget>[
                  optionCard(color, "YES", count),
                  SizedBox(
                    width: 35.0,
                  ),
                  optionCard(color, "NO", count),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("2. What is expected cost of the House?"),                       //Questtion 2
              const SizedBox(
                height: 10.0,
              ),
              textField(),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("3. How is living Standard of the Borrower?"),                    //Questtion 3
              Row(
                children: <Widget>[
                  optionCard(color, "GOOD", count),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "AVERAGE", count),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "POOR", count),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("4. Is address in Negative Area?"),                                 //Questtion 4
              Row(
                children: <Widget>[
                  optionCard(color, "YES", count),
                  SizedBox(
                    width: 35.0,
                  ),
                  optionCard(color, "NO", count),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("5. Mention the Landline Number Available"),                         //Questtion 5
              const SizedBox(
                height: 10.0,
              ),
              textField(),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("6. Write the mobile number of a Family Member"),                    //Questtion 6
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
                    onChanged: (bool val) {
                      setState(() {
                        check = val;
                      });
                    },
                  ),
                  //const SizedBox(width: 5.0,),
                  Text(
                    "Have Checked the mentioned office and residence number during the FI",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              questionForm("7. Permanent address of the Borrower"),                       //Questtion 7
              const SizedBox(
                height: 5.0,
              ),
              TextField(
                maxLines: 4,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Answer"),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: address,
                    onChanged: (bool val) {
                      setState(() {
                        address = val;
                      });
                    },
                  ),
                  //const SizedBox(width: 5.0,),
                  Text(
                    "Have Checked the mentioned office and residence number during the FI",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text('Upload'),
                    onPressed: () {
                      _optionsDialogBox(1);
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
                height: 5.0,
              ),
              questionForm("8. Behaviour of the Borrower"),                             //Questtion 8
              Row(
                children: <Widget>[
                  optionCard(color, "GOOD", count),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "AVERAGE", count),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "POOR", count),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm("9. Physical appearance of the Borrower"),                     //Questtion 9
              Row(
                children: <Widget>[
                  optionCard(color, "GOOD", count),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "AVERAGE", count),
                  SizedBox(
                    width: 2.0,
                  ),
                  optionCard(color, "POOR", count),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm(
                  "10. Check Goodwill from neighbour and enter their details."),                     //Questtion 10
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Name",
                    prefixIcon: new Icon(Icons.people)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Number",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Number",
                    prefixIcon: new Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm(
                  "11. Please mention Public transport Available for Borrower residence"),                    //Questtion 11
              const SizedBox(
                height: 10.0,
              ),
              textField(),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm(
                  "12. Is there any family member comes under negative Profile like STD PCO, Cable operator, Court, Police, Political or Financial Business"),          //Questtion 12
              const SizedBox(
                height: 10.0,
              ),
              textField(),
              const SizedBox(
                height: 10.0,
              ),
              questionForm(
                  "13. Mention Name of the person met during the Field Visit and his Number"),                          //Questtion 13
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Name",
                    prefixIcon: new Icon(Icons.people)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Number",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Number",
                    prefixIcon: new Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm(
                  "14. Name of the dealer,broker, Old Customer and Mobile number"),               //Questtion 14
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Name",
                    prefixIcon: new Icon(Icons.people)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Number",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Number",
                    prefixIcon: new Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 5.0,
              ),
              questionForm(
                  "15. Borrower Office details with number of working years and reference from office"),                    //Questtion 15
              const SizedBox(
                height: 5.0,
              ),
              TextField(
                maxLines: 4,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Answer"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm(
                  "16. Give number of two neighbours of the residence"),                            //Questtion 16
              const SizedBox(
                height: 10.0,
              ),
              Text(
                " Neighbour 1",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: Colors.black38),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Name",
                    prefixIcon: new Icon(Icons.people)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Number",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Number",
                    prefixIcon: new Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                " Neighbour 2",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: Colors.black38),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Name",
                    prefixIcon: new Icon(Icons.people)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Number",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Number",
                    prefixIcon: new Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              questionForm(           
                  "17. Is there any CIBIL defaulter. Mention the reason of default and attach closer document of loan."),                     //Questtion 17
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                maxLines: 3,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Answer"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text('Upload'),
                    onPressed: () {
                      _optionsDialogBox(2);
                    },
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(closer,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.teal[300])),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //This function displays a dialouge box to choose from camera or gallery.

  Future<void> _optionsDialogBox(int i) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: () {
                      openCamera(i);
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: () {
                      openGallery(i);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  //This function opens camera and saves the clicked picture.
  void openCamera(int i) async {
    if (i == 1) {
      picture = await ImagePicker.pickImage(source: ImageSource.camera);
      if (picture != null) {
        setState(() {
          docUpload = "Document Uploaded.";
        });
      }
    }
    else if(i==2){
      closerPic = await ImagePicker.pickImage(source: ImageSource.camera);
      if (closerPic!= null) {
        setState(() {
          closer = "Document Uploaded.";
        });
      }
    }
  }


  // It saves the picture selected from gallery.
  void openGallery(int i) async {
    if (i == 1) {
      gallery = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (gallery!= null) {
        setState(() {
          docUpload = "Document Uploaded.";
        });
      }
    }
    else if(i==2){
      closerPic = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (closerPic!= null) {
        setState(() {
          closer = "Document Uploaded.";
        });
      }
    }
  }

  Widget optionCard(Color col, String text, int count) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 65.0,
      width: 117.0,
      child: InkWell(
        onTap: () {
          setState(() {
            col = Colors.teal;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.teal[200], width: 2)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          )),
          elevation: 10.0,
          color: col,
        ),
      ),
    );
  }

  Widget questionForm(String text) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 27.0, color: Colors.black),
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
