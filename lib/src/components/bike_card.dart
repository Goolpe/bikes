import 'package:bikes/shelf.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeCard extends StatelessWidget {
  BikeCard({
    @required this.data
  }) : assert(data != null);

  final Bike data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child: InkWell(
        onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => BikeScreen())),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    data.photoUrl,
                  ),
                  fit: BoxFit.contain
                )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Text(data.name.toUpperCase(), 
                            style: TextStyle(
                              fontFamily: 'IBMPlexSans-Bold',
                              color: Color(0xff1C2740), 
                              fontWeight: FontWeight.bold, 
                              letterSpacing: 1.2,
                              fontSize: 14
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: RichText(
                      text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Frame Size: '),
                        TextSpan(text: '${data.frameSize}', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                      )
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BikesBadge(label: data.category),
                      Row(
                        children: <Widget>[
                          Icon(Icons.place, color: Color(0xff0F1E2D)),
                          Text(data.location, style: TextStyle(color: Color(0xff0F1E2D)))
                        ]
                      )
                    ]
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}