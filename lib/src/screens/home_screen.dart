import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BikesScaffold(
      backgroundColor: Color(0xffF0F1F5),
      body: Stack(
        children: <Widget>[
          Consumer<BikesProvider>(
            builder: (BuildContext context, BikesProvider state, _){
              if(state.fetchingBike){
                return SizedBox();
              } else if(state.bikes == null || state.bikes.isEmpty){
                return Center(
                  child: Text('No Bikes here, add a new one'),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.only(top: 4, bottom: 70),
                itemCount: state.bikes.length,
                itemBuilder: (BuildContext context, int i){
                  return BikeCard(data: state.bikes[i]);
                }
              );
            }
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
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
              onTap: () => 
                Navigator.push<Widget>(context, CupertinoPageRoute(
                  builder: (context) => EditBikeScreen()
                )
              ),
            ),
          )
        ]
      )
    );
  }
}