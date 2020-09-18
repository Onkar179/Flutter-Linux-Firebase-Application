import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/it.jpg'),
            fit: BoxFit.fill,
          ),
          title: Text(
            'Login',
            textAlign: TextAlign.center,
          ),
          leading: Icon(
            CupertinoIcons.profile_circled,
            size: 50,
            color: Colors.white,
          ),
        ),
        body: Center(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/final.jpg'),
                        fit: BoxFit.fill)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.white),
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.redAccent,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        margin: EdgeInsets.only(top: 10),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                          elevation: 10,
                          child: MaterialButton(
                              minWidth: 200,
                              height: 40,
                              child: Text('Sign In'),
                              onPressed: () async {
                                var userSignin =
                                    await authc.signInWithEmailAndPassword(
                                        email: email, password: password);
                                print(userSignin);
                                if (userSignin != null) {
                                  Navigator.pushNamed(context, "terminal");
                                }
                              }),
                        ),
                      )
                    ]))));
  }
}
