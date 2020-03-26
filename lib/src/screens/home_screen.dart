import 'package:bikes/shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/logo.svg',
        ),
        centerTitle: true,
      ),
      body: Consumer<BikesNotifier>(
        builder: (BuildContext context, BikesNotifier state, _){
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 4),
            itemCount: state.data.length,
            itemBuilder: (BuildContext context, int i){
              return BikeCard(data: state.data[i]);
            }
          );
        }
      )
    );
  }
}