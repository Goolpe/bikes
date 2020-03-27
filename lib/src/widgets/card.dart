import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BikesCardType {
  vertical,
  horizontal
}

class BikesCard extends StatelessWidget {
  BikesCard({
    @required this.data,
    this.type = BikesCardType.horizontal,
    this.onTap,
    this.onDelete,
  }) : assert(data != null);

  final Bike data;
  final BikesCardType type;
  final void Function() onTap;
  final void Function() onDelete;

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
        child: _card(context),
        onTap: onTap
      ),
    );
  }

  Widget _card(BuildContext context){
    if(type == BikesCardType.horizontal){
      return Row(
        children: <Widget>[
          BikesImage(photoUrl: data.photoUrl),
          Expanded(child: _widget())
        ]
      );
    } else{
      return Column(
        children: <Widget>[
          _widget(fontSize: 24, showPrice: true),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: BikesImage(
              width: MediaQuery.of(context).size.width,
              height: 300,
              photoUrl: data.photoUrl,
            ),
          )
        ]
      );
    }
  }

  Widget _widget({
    double fontSize = 16,
    bool showPrice = false
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BikesListTile(
          title: data.name ?? '',
          id: data.id,
          fontSize: fontSize,
          onDelete: onDelete
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child:Row(
            children: <Widget>[
              BikesRichText(
                label1: 'Frame Size: ',
                label2: data.frameSize ?? '',
              ),
              showPrice
              ? Padding(
                padding: EdgeInsets.only(left: 24),
                child: BikesRichText(
                  label1: 'Price Range: ',
                  label2: data.priceRange ?? '',
                )
              ) : SizedBox(),
            ]
          )
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
                  Icon(Icons.place, color: COLOR_PRIMARY_TEXT),
                ]
              )
            )
          ]
        ),
      ]
    );
  }
}