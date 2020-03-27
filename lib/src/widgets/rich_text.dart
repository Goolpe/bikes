import 'package:flutter/material.dart';

class BikesRichText extends StatelessWidget {
  BikesRichText({
    @required this.label1,
    @required this.label2
  }) : assert(label1 != null && label2 != null);

  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        overflow: TextOverflow.ellipsis, 
        text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: label1),
          TextSpan(
            text: label2, 
            style: TextStyle(
              fontWeight: FontWeight.bold
            )
          ),
        ],
        )
      )
    );
  }
}