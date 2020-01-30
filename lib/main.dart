import 'package:flutter/material.dart';
import 'package:ne_first_look/dashboard.dart';
import 'package:ne_first_look/services/call_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CustomerLogin(),
      theme: new ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomerLogin extends StatefulWidget {
  @override
  State createState() => new LoginState();
}

class LoginState extends State<CustomerLogin>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 700));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlutterLogo(
              size: _iconAnimation.value * 100,
            ),
            new Form(
                child: Theme(
              data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                    color: Colors.teal,
                    fontSize: 20.0,
                  ))),
              child: Container(
                padding: const EdgeInsets.all(40.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    emailField(),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20),
                    ),
                    passwordField(),
                    new Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                    ),
                    new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text('Login'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Dashboard()));
                      },
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          hintStyle: TextStyle(color: Colors.black),
          hintText: "Username",
          labelText: "Enter username",
          prefixIcon: new Icon(Icons.alternate_email)),
    );
  }

  Widget passwordField() {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          hintStyle: TextStyle(color: Colors.black),
          hintText: "Password",
          labelText: "Enter Password",
          prefixIcon: new Icon(Icons.lock)),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }
}
