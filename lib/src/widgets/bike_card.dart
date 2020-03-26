import 'package:bikes/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
        onTap: () => data.id == null
        ? null
        : Navigator.push<Widget>(context, CupertinoPageRoute(builder: (context) => BikeScreen(id: data.id))),
        child: Row(
          children: <Widget>[
            BikesImage(
              photoUrl: data.photoUrl
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Text(data.name == null ? '' : data.name.toUpperCase(), 
                            overflow: TextOverflow.ellipsis, 
                            maxLines: 2,
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
                      PopupMenuButton<String>(
                        padding: EdgeInsets.all(0),
                        onSelected: (String value){
                            if(value == 'Delete'){
                              Provider.of<BikesProvider>(context, listen: false).removeBike(data.id);
                            } else if(value == 'Edit'){
                              Navigator.push<Widget>(
                                context, CupertinoPageRoute(
                                builder: (context) => EditBikeScreen(id: data.id)
                              ));
                            }
                        },
                        itemBuilder: (BuildContext context) {
                          return <String>['Delete', 'Edit'].map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: RichText(
                      overflow: TextOverflow.ellipsis, 
                      text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Frame Size: '),
                        TextSpan(
                          text: data.frameSize ?? '', 
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                      )
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: data.category == null
                        ? SizedBox()
                        : BikesBadge(label: data.category)
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Text(data.location ?? '',
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis, 
                                style: TextStyle(color: Color(0xff0F1E2D)
                                )
                              )
                            ),
                            Icon(Icons.place, color: Color(0xff0F1E2D)),
                          ]
                        )
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