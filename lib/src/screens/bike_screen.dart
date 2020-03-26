import 'package:bikes/shelf.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BikeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/logo.svg',
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Consumer<BikesNotifier>(
        builder: (BuildContext context, BikesNotifier state, _){
          return ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(state.data[0].name.toUpperCase(), 
                          style: TextStyle(
                            fontFamily: 'IBMPlexSans-Bold',
                            color: Color(0xff1C2740), 
                            fontWeight: FontWeight.bold, 
                            letterSpacing: 1.2,
                            fontSize: 24
                          )
                        ),
                      )
                    ),
                    InkWell(
                      child: Icon(Icons.more_vert),
                      onTap: (){},
                    )
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BikesBadge(label: state.data[0].category),
                    Row(
                      children: <Widget>[
                        Icon(Icons.place, color: Color(0xff0F1E2D)),
                        Text(state.data[0].location, style: TextStyle(color: Color(0xff0F1E2D)))
                      ]
                    )
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CachedNetworkImage(
                  imageUrl: state.data[0].photoUrl,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text('Description'.toUpperCase(), 
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans-Bold',
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(state.data[0].description, 
                  style: TextStyle(fontSize: 16)
                )
              )
            ],
          );
        }
      )
    );
  }
}