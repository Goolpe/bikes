import 'package:bikes/shelf.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        : Navigator.push(context, CupertinoPageRoute(builder: (context) => BikeScreen(id: data.id))),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(right: 8),
              child: data.photoUrl != null || data.photoUrl.isEmpty
              ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffF0F1F5))
                ),
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    'assets/no_photo.svg',
                  )
                )
              )
              : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      data.photoUrl,
                    ),
                    fit: BoxFit.contain
                  )
                ),
              )
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
                      InkWell(
                        child: Icon(Icons.more_vert),
                        onTap: (){},
                      )
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