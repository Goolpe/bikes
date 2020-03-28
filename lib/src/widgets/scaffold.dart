import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BikesScaffold extends StatelessWidget {
  BikesScaffold({
    this.body,
    this.backgroundColor
  });
  
  final Widget body;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/logo.svg',
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: body
    );
  }
}