import 'package:flutter/material.dart';

class DecoratedOutlineButton extends StatefulWidget {
  @required
  final VoidCallback onPressed;
  final Color primaryColor;
  final String text;

  const DecoratedOutlineButton({
    Key key,
    this.onPressed,
    this.primaryColor = Colors.grey,
    this.text,
  }) : super(key: key);

  @override
  _DecoratedOutlineButtonState createState() => _DecoratedOutlineButtonState();
}

class _DecoratedOutlineButtonState extends State<DecoratedOutlineButton> {
  var _hoveringButton = false;

  void _mouseEnterButton(bool hover) {
    setState(() {
      _hoveringButton = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnterButton(true),
      onExit: (e) => _mouseEnterButton(false),
      child: OutlineButton(
        onPressed: widget.onPressed,
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        color: Colors.white,
        hoverColor: widget.primaryColor,
        textColor: _hoveringButton ? Colors.white : widget.primaryColor,
        borderSide: BorderSide(width: 1.5, color: widget.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          widget.text ?? '',
        ),
      ),
    );
  }
}
