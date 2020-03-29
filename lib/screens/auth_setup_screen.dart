import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/dashboard.dart';

class AuthSetupScreen extends StatefulWidget {
  static const String routeName = "setup";

  @override
  _AuthSetupScreenState createState() => _AuthSetupScreenState();
}

class _AuthSetupScreenState extends State<AuthSetupScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: RaisedButton(
            child: Text("Submit"),
            onPressed: () =>
                Navigator.of(context).pushNamed(Dashboard.routeName),
          ),
        ),
      ]),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 8.0,
              right: 8.0,
            ),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Your first meter/device",
                  style: TextStyle(fontSize: 24.0),
                ),
                Text(
                  "Oniya Daniel",
                ),
              ]),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 48.0),
                      Text(
                        "SELECT UTILITY",
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 12.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xff909090),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 0.0,
                              ),
                              child: FlatButton(
                                child: Column(children: [
                                  Icon(Icons.opacity),
                                  Text("Water"),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xff909090),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 0.0,
                              ),
                              child: FlatButton(
                                child: Column(children: [
                                  Icon(Icons.power),
                                  Text("Power"),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 48.0),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Select Disco',
                        ),
                      ),
                      SizedBox(height: 48.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Meter Number',
                        ),
                      ),
                      SizedBox(height: 48.0),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Give your meter a name for convenience",
                        style: TextStyle(
                          color: Color.fromRGBO(150, 150, 150, 0.7),
                        ),
                      ),
                      SizedBox(height: 48.0),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
