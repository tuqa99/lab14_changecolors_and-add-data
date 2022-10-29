import 'package:flutter/material.dart';
import 'package:lab14/screens/login.dart';

class Seondpage extends StatelessWidget {
  Seondpage({required this.name, required this.state, required this.email1});
  String? name;
  String? state;
  String? email1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
              ),
              Column(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 44, color: Colors.black12),
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Text('Email',
                      style: TextStyle(fontSize: 44, color: Colors.black12)),
                  SizedBox(
                    width: 33,
                  ),
                  Text('the state',
                      style: TextStyle(fontSize: 44, color: Colors.black12)),
                ],
              ),
              Column(
                children: [
                  Text('${name}'),
                  SizedBox(
                    width: 44,
                  ),
                  Text("$email1"),
                  SizedBox(
                    width: 44,
                  ),
                  Text("$state")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
