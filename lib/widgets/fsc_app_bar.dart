import 'package:flutter/material.dart';

import '../style.dart';

class FscAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(Size.fromHeight(46.0)),
      child: AppBar(
        backgroundColor: white,
        shadowColor: Colors.grey.shade400,
        elevation: 3.0,
        title: Text(
          'FSC Remote Auditing',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        actionsIconTheme: IconThemeData(color: deep_green),
        actions: [
          IconButton(
            tooltip: 'Settings',
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              tooltip: 'Profile',
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
