import 'package:flutter/material.dart';
import 'package:lab14/screens/2nd.dart';
import './login.dart';
import 'dart:math';

class FirstScreen extends StatefulWidget {
  Color? name;
  FirstScreen(
      {this.name,
      required this.Name2,
      required this.email1,
      this.mycolor,
      this.test});
  String Name2;
  String email1;
  String? test;
  List<Colors>? mycolor;
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.name,
      appBar: AppBar(),
      body: Container(
        decoration: widget.name == null
            ? BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      Colors.accents[Random().nextInt(Colors.accents.length)],
                    ]),
              )
            : BoxDecoration(
                color: widget.name,
              ),
        child: Column(
          children: [
            Center(
              child: Text('Choose your state'),
            ),
            RadioListTile(
              title: Text("Admine"),
              value: "admin",
              groupValue: state,
              onChanged: (value) {
                setState(() {
                  state = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("User"),
              value: "user",
              groupValue: state,
              onChanged: (value) {
                setState(() {
                  state = value.toString();
                });
              },
            ),
            Center(
              child: MaterialButton(
                color: Colors.blueGrey,
                child: Text("Next"),
                onPressed: () {
                  print(widget.Name2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Seondpage(
                        state: state,
                        name: widget.Name2,
                        email1: widget.email1,
                      );
                    }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
