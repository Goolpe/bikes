import 'package:bikes/index.dart';
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
                  BikesListTile(
                    title: data.name ?? '',
                    id: data.id,
                  ),
                  BikesRichText(
                    label1: 'Frame Size: ',
                    label2: data.frameSize ?? ''
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
                                overflow: TextOverflow.ellipsis
                              )
                            ),
                            Icon(Icons.place),
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