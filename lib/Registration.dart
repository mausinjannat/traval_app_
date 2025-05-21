import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Home.dart';


class Registration extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image

          Image.asset(
            'assets/images/image2.jpg',
            fit: BoxFit.cover,
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),


                  ElevatedButton(
                    onPressed: () async{
                      //var login = await auth.signInWithEmailAndPassword(email: email, password: password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                      // Handle form submission here
                    },
                    child: Text("Submit", style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
