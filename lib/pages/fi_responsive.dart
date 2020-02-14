/*
Date: 12 February 2020
Title: Responsive FI form
Description: This page will desplay reponsive Field investigation form.
Developer: Ashish Verma
*/

import 'package:flutter/material.dart';
import 'fi_components.dart';
import 'package:image_picker/image_picker.dart';

List<Question1Form> type1Form = new List(2);
List<Question2Form> type2Form = new List(3);
List<Question3Form> type3Form = new List(6);
List<Question4Form> type4Form = new List(3);
Question5Form type5Form;
Question6Form type6Form;
Question7Form type7Form;
bool isOfficeAndResidenceNoChecked = false;
var screenWidth;

class ResponsiveFI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        debugShowCheckedModeBanner: false,
        home: FIPage());
  }
}

class FIPage extends StatefulWidget {
  State createState() => FIPageState();
}

class FIPageState extends State<FIPage> {
  String docUpload = "Attach valid address proof.";
  String closer = "Attach closer document";
  var closerPic;
  var addressProof;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 2; i++) {
      //Initialising type 1 class members
      type1Form[i] = new Question1Form();
      type1Form[i].quest = typeOneQ[i];
    }

    for (int i = 0; i < 3; i++) {
      //Initialising type 2 class members
      type2Form[i] = new Question2Form();
      type2Form[i].quest = typeTwoQ[i];
      //Initialising type 4 class members
      type4Form[i] = new Question4Form();
      type4Form[i].quest = typeFourQ[i];
    }

    for (int i = 0; i < 6; i++) {
      //Initialising type 3 class members
      type3Form[i] = new Question3Form();
      type3Form[i].quest = typeThreeQ[i];
    }

    //Initialising type 5 class members
    type5Form = new Question5Form();
    type5Form.quest = typeFiveQ[0];

    //Initialising type 6 class members
    type6Form = new Question6Form();
    type6Form.quest = typeSixQ[0];

    //Initialising type 7 class members
    type7Form = new Question7Form();
    type7Form.quest = typeSevenQ[0];
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Field Investigation',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _type1(type1Form[0]), //Question 1
              _type3(type3Form[0], 1), //Question 2
              _type2(type2Form[0]), //Question 3
              _type1(type1Form[1]), //Question 4
              _type3(type3Form[1], 1), //Question 5
              _type3(type3Form[2], 1), //Question 6
              numberCheckbox(),
              _type6(type6Form, 4), //Question 7
              _type2(type2Form[1]), //Question 8
              _type2(type2Form[2]), //Question 9
              _type4(type4Form[0]), //Question 10
              _type3(type3Form[3], 1), //Question 11
              _type3(type3Form[4], 1), //Question 12
              _type4(type4Form[1]), //Question 13
              _type4(type4Form[2]), //Question 14
              _type3(type3Form[5], 4), //Question 15
              _type5(type5Form), //Question 16
              _type7(type7Form, 4), //Question 17
            ],
          ),
        ),
      ),
    );
  }

  Widget _type1(Question1Form curQuest) {
    return Container(
        //padding: const EdgeInsets.all(8.0),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          curQuest.quest,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 27.0, color: Colors.black),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 117,
              height: 65,
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  curQuest.yes = !curQuest.yes;
                  if (curQuest.yes) {
                    setState(() {
                      curQuest.no = false;
                    });
                  } else {
                    setState(() {});
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.teal[200], width: 2)),
                  child: Center(
                      child: Text(
                    'YES',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )),
                  elevation: 10.0,
                  color: curQuest.yes == false ? Colors.white : Colors.teal,
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Container(
              width: 117,
              height: 65,
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  curQuest.no = !curQuest.no;
                  if (curQuest.no) {
                    setState(() {
                      curQuest.yes = false;
                    });
                  } else {
                    setState(() {});
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.teal[200], width: 2)),
                  child: Center(
                      child: Text(
                    'NO',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )),
                  elevation: 10.0,
                  color: curQuest.no == false ? Colors.white : Colors.teal,
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget _type2(Question2Form curQuest) {
    return Container(
        //padding: const EdgeInsets.all(8.0),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          curQuest.quest,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 27.0, color: Colors.black),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: screenWidth / 4,
              height: 65,
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  curQuest.good = !curQuest.good;
                  if (curQuest.good) {
                    setState(() {
                      curQuest.average = false;
                      curQuest.poor = false;
                    });
                  } else {
                    setState(() {});
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.teal[200], width: 2)),
                  child: Center(
                      child: Text(
                    'GOOD',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )),
                  elevation: 10.0,
                  color: curQuest.good == false ? Colors.white : Colors.teal,
                ),
              ),
            ),
            Container(
              width: screenWidth / 3,
              height: 65,
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  curQuest.average = !curQuest.average;
                  if (curQuest.average) {
                    setState(() {
                      curQuest.good = false;
                      curQuest.poor = false;
                    });
                  } else {
                    setState(() {});
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.teal[200], width: 2)),
                  child: Center(
                      child: Text(
                    'AVERAGE',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )),
                  elevation: 10.0,
                  color: curQuest.average == false ? Colors.white : Colors.teal,
                ),
              ),
            ),
            Container(
              width: screenWidth / 4,
              height: 65,
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  curQuest.poor = !curQuest.poor;
                  if (curQuest.poor) {
                    setState(() {
                      curQuest.good = false;
                      curQuest.average = false;
                    });
                  } else {
                    setState(() {});
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.teal[200], width: 2)),
                  child: Center(
                      child: Text(
                    'POOR',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )),
                  elevation: 10.0,
                  color: curQuest.poor == false ? Colors.white : Colors.teal,
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget _type3(Question3Form curQuest, int maxLines) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            curQuest.quest,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 27.0,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (text) {
              curQuest.ans = text;
            },
            maxLines: maxLines,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: new BorderSide(color: Colors.teal)),
                hintStyle: TextStyle(color: Colors.black),
                labelText: "Answer",
                prefixIcon: new Icon(Icons.question_answer)),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  Widget _type4(Question4Form curQuest) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            curQuest.quest,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 27.0,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (text) {
              curQuest.name = text;
            },
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
            onChanged: (text) {
              curQuest.number = int.parse(text);
            },
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
          )
        ],
      ),
    );
  }

  Widget _type5(Question5Form curQuest) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            curQuest.quest,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 27.0,
                color: Colors.black),
          ),
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
            onChanged: (val) {
              curQuest.aName = val;
            },
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
            onChanged: (val) {
              curQuest.aNumber = int.parse(val);
            },
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
            onChanged: (val) {
              curQuest.bName = val;
            },
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
            onChanged: (val) {
              curQuest.bNumber = int.parse(val);
            },
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
          )
        ],
      ),
    );
  }

  Widget numberCheckbox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: isOfficeAndResidenceNoChecked,
          onChanged: (bool val) {
            setState(() {
              isOfficeAndResidenceNoChecked = val;
            });
          },
        ),
        //const SizedBox(width: 5.0,),
        Text(
          "Have Checked the mentioned office and residence number during the FI",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

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
      addressProof = await ImagePicker.pickImage(source: ImageSource.camera);
      if (addressProof != null) {
        setState(() {
          docUpload = "Document Uploaded.";
        });
      }
    } else if (i == 2) {
      closerPic = await ImagePicker.pickImage(source: ImageSource.camera);
      if (closerPic != null) {
        setState(() {
          closer = "Document Uploaded.";
        });
      }
    }
  }

  // It saves the picture selected from gallery.
  void openGallery(int i) async {
    if (i == 1) {
      addressProof = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (addressProof != null) {
        setState(() {
          docUpload = "Document Uploaded.";
        });
      }
    } else if (i == 2) {
      closerPic = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (closerPic != null) {
        setState(() {
          closer = "Document Uploaded.";
        });
      }
    }
  }

  Widget _type6(Question6Form curQuest, int maxLines) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            curQuest.quest,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 27.0,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Visibility(
            visible: !curQuest.sameAddress,
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (text) {
                curQuest.ans = text;
              },
              maxLines: maxLines,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: "Answer",
                  prefixIcon: new Icon(Icons.question_answer)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: curQuest.sameAddress,
                onChanged: (bool val) {
                  setState(() {
                    curQuest.sameAddress = val;
                  });
                },
              ),
              //const SizedBox(width: 5.0,),
              Text(
                "Same as Residence address",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
        ],
      ),
    );
  }

  Widget _type7(Question7Form curQuest, int maxLines) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            curQuest.quest,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 27.0,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (text) {
              curQuest.ans = text;
            },
            maxLines: maxLines,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: new BorderSide(color: Colors.teal)),
                hintStyle: TextStyle(color: Colors.black),
                labelText: "Answer",
                prefixIcon: new Icon(Icons.question_answer)),
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
        ],
      ),
    );
  }
}
