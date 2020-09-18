import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatefulWidget {
  @override
  Mystate createState() => Mystate();
}

class Mystate extends State<MyApp> {
  var msgcontroller = TextEditingController();
  var cmd;
  var state;

  launchurl() async {
    const url =
        "https://console.firebase.google.com/project/flutterproject-6d1c2/firestore/data~2FData~2F1bUOIqfWL0w6ZGLCd8eT";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'error setting up connection $url';
    }
  }

  data(cmd) async {
    var fsconnect = FirebaseFirestore.instance;
    var authc = FirebaseAuth.instance;
    var signInUser = authc.currentUser.email;

    var url = "http://192.168.43.249/cgi-bin/onkar.py?x=${cmd}";
    var response = await http.get(url);

    setState(() {
      state = response.body;
    });
    await fsconnect.collection('LinuxOutput').add({
      "User": signInUser,
      '$cmd': '$state',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Linux Mobile', textAlign: TextAlign.center),
          leading: Image.asset('assets/linux.png'),
          flexibleSpace: Image.asset(
            'assets/onkar.jpg',
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img.jpg'), fit: BoxFit.fill)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Card(
                      color: Colors.black,
                      child: TextField(
                        controller: msgcontroller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: '  Enter Your Linux Command',
                            hintStyle: TextStyle(color: Colors.red),
                            fillColor: Colors.white,
                            prefixText: '[root@localhost ~]#',
                            prefixStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                            focusColor: Colors.blue,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45))),
                        onChanged: (value) {
                          cmd = value;
                        },
                        autocorrect: true,
                        showCursor: true,
                      ),
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Material(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 10,
                        child: MaterialButton(
                          splashColor: Colors.blue,
                          minWidth: 200,
                          height: 40,
                          onPressed: () {
                            data(cmd);
                            msgcontroller.clear();
                          },
                          child: Text('Run Command'),
                          textColor: Colors.black,
                        ),
                      )),
                  Container(
                    height: 400,
                    width: 300,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber),
                    child: Card(
                      color: Colors.black,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            state ?? "  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Material(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 10,
                          child: MaterialButton(
                            minWidth: 200,
                            height: 30,
                            child: Text('Go Firebase'),
                            onPressed: () {
                              launchurl();
                            },
                          )))
                ],
              ),
            ),
          ),
        ));
  }
}
