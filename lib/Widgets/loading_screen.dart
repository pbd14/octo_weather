import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key }) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          child: const Center(
            child: SpinKitWave(
              color: primaryColor,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
