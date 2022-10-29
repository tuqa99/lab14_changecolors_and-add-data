import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab14/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '1stscreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Name = TextEditingController();
  CollectionReference usersadd = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 44,
                ),
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        ' Sign up',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Create an account'),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: Name,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 62, 38, 202),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 62, 38, 202))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 33,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: email,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 62, 38, 202),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 62, 38, 202))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 33,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: password,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 62, 38, 202),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 62, 38, 202))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 33,
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () async {
                    try {
                      var authenticationobject = FirebaseAuth.instance;

                      UserCredential myUser = await authenticationobject
                          .createUserWithEmailAndPassword(
                              email: email.text, password: password.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("added successfully")));
                      if (Name.text == 'blue') {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen(
                              email1: email.text.toString(),
                              name: Colors.blue,
                              Name2: Name.text.toString(),
                            );
                          },
                        ));
                      } else if (Name.text == 'red') {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen(
                              email1: email.text.toString(),
                              name: Colors.red,
                              Name2: Name.text.toString(),
                            );
                          },
                        ));
                      } else if (Name.text == 'green') {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen(
                              email1: email.text.toString(),
                              name: Colors.green,
                              Name2: Name.text.toString(),
                            );
                          },
                        ));
                      } else if (Name.text == 'mixcolor') {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen(
                              email1: email.text.toString(),
                              name: Colors.deepOrangeAccent,
                              Name2: Name.text.toString(),
                            );
                          },
                        ));
                      }
                      usersadd.add({
                        "Email": email.text,
                        "Name": Name.text,
                        "password": password.text
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("sorry there is an error")));
                    }
                  },
                  minWidth: 350,
                  height: 60,
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Sign UP",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have  an account ?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
