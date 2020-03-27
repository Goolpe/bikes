import 'package:flutter/material.dart';

class BikesButton extends StatelessWidget {
  BikesButton({
    @required this.label,
    this.onPressed
  }) : assert(label != null);

  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      height: 60,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        elevation: 0,
        textColor: Colors.white,
        child: Text(label),
        onPressed: onPressed,
      )
    );
  }
}