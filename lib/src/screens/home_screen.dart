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
      body: Stack(
        children: <Widget>[
          Consumer<BikesNotifier>(
            builder: (BuildContext context, BikesNotifier state, _){
              if(state.loading){
                return SizedBox();
              } else if(state.data == null || state.data.isEmpty){
                return Center(
                  child: Text('No Bikes here, add a new one'),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.only(top: 4, bottom: 70),
                itemCount: state.data.length,
                itemBuilder: (BuildContext context, int i){
                  return BikeCard(data: state.data[i]);
                }
              );
            }
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 5, 5),
                child: Icon(
                  Icons.add, 
                  color: Colors.white, 
                  size: 48,
                )
              ),
            ),
          )
        ]
      )
    );
  }
}