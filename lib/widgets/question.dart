import 'package:flutter/material.dart';
import '../style.dart';

class Question extends StatelessWidget {
  final String number;
  final String text;

  const Question({Key key, this.number, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 8.0),
      leading: CircleAvatar(
        backgroundColor: blue_grey,
        radius: 18.0,
        child: Text(
          number ?? '',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      title: Text(
        text ?? '',
        style: Theme.of(context).primaryTextTheme.subtitle1,
      ),
    );
  }
}
