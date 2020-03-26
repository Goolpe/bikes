import 'package:flutter/material.dart';

class BikesBadge extends StatelessWidget {
  const BikesBadge({
    @required this.label
  }) : assert(label != null);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff00E1AA))
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(label, 
        overflow: TextOverflow.ellipsis, 
        style: TextStyle(
          color: Color(0xff00E1AA), 
          fontSize: 12
        )
      ),
    );
  }
}