import 'dart:async';

import 'package:flutter/material.dart';
import 'package:general_informative_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: Image(
                image: AssetImage('images/logon.png'),
              ),
            ),
            Text(
              'General Informative',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Developed by:  Kashif Bacha',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
