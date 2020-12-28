import 'package:flutter/material.dart';
import 'package:fsc_cert/defaults.dart';

class FlexiblePage extends StatefulWidget {
  @override
  _FlexiblePageState createState() => _FlexiblePageState();
}

class _FlexiblePageState extends State<FlexiblePage> {
  var _width = 400.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Image.asset(kMyFscTransparent, width: _width),
      ),
    );
  }
}
