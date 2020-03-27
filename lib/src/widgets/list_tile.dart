import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikesListTile extends StatelessWidget {
  BikesListTile({
    @required this.title,
    @required this.id,
    this.fontSize = 16,
    this.onDelete
  }) : assert(title != null);

  final String title;
  final int id;
  final double fontSize;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(title.toUpperCase(), 
                style: Theme.of(context).textTheme.body2.copyWith(
                  fontWeight: FontWeight.bold, 
                  fontSize: fontSize,
                  letterSpacing: 1.2,
                )
              ),
            )
          ),
          PopupMenuButton<String>(
            onSelected: (String value){
            if(value == 'Delete'){
              Provider.of<BikesProvider>(context, listen: false).removeBike(id);
              onDelete != null ? onDelete() : null;
            } else if(value == 'Edit'){
              Navigator.push<Widget>(
                context, CupertinoPageRoute(
                builder: (context) => EditBikeScreen(id: id)
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
    );
  }
}