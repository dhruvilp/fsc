import 'package:flutter/material.dart';
import 'package:fsc_cert/defaults.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Image.asset(
          kAppIconTransparent,
          width: 200.0,
        ),
      ),
    );
  }
}
