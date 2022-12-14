import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_mobile/app/constants.dart';
import 'package:uas_mobile/app/modules/homePage.dart';
import 'package:uas_mobile/app/modules/onBoardingView.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  TextStyle style2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 138, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: SingleChildScrollView(
          child: Container(
            height: 600,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Welcome to Our App",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Login Page",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email Address",
                    hintText: "Email Address",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins Light',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password",
                    hintText: "Password",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins Light',
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    int id;

                    try {
                      var email = await Dio().get(
                          'http://localhost:3000/users?email=${emailController.text}');
                      var password = await Dio().get(
                          'http://localhost:3000/users?password=${passController.text}');
                      if (email.data.length > 0) {
                        if (password.data.length > 0) {
                          id = email.data[0]['id'];

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageView()));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text("Password is incorrect"),
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Text("Email is incorrect")));
                      }
                    } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "Internal server error",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 60)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(BlueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: BlueAccent)))),
                  child: Text("Login", style: style2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
