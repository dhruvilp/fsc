import 'package:flutter/material.dart';
import '../pages/flexible_page.dart';

class MobileLayout extends StatefulWidget {
  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Layout'),
      ),
      body: FlexiblePage(),
    );
  }
}
