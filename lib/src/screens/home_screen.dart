import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BikesScaffold(
      backgroundColor: COLOR_BACKGROUND,
      body: Stack(
        children: <Widget>[
          BikesScreen(),
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