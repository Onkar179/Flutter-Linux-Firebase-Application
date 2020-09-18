import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'welcome',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              textDirection: TextDirection.ltr,
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/nature.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img1.jpg'), fit: BoxFit.fill)),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellowAccent),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20),
                      elevation: 10,
                      child: MaterialButton(
                        minWidth: 200,
                        height: 40,
                        child: Text('Login'),
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Material(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10,
                        child: MaterialButton(
                          minWidth: 200,
                          height: 40,
                          child: Text('New User'),
                          onPressed: () {
                            Navigator.pushNamed(context, "register");
                          },
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
