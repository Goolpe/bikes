import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikeScreen extends StatefulWidget {
  BikeScreen({
    @required this.id
  }) : assert(id != null);

  final int id;

  @override
  _BikeScreenState createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
      Provider.of<BikesProvider>(context, listen: false)
        .fetchBike(widget.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BikesScaffold(
      body: Consumer<BikesProvider>(
        builder: (BuildContext context, BikesProvider state, _){
          if(state.fetchingBike || state.bike == null){
            return SizedBox();
          }
          return ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(state.bike.name.toUpperCase(), 
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
                    PopupMenuButton<String>(
                      padding: EdgeInsets.all(0),
                      onSelected: (String value){
                          if(value == 'Delete'){
                            Provider.of<BikesProvider>(context, listen: false).removeBike(widget.id);
                            Navigator.pop(context);
                          } else if(value == 'Edit'){
                            Navigator.push<Widget>(
                              context, CupertinoPageRoute(
                              builder: (context) => EditBikeScreen()
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BikesBadge(label: state.bike.category)
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Text(state.bike.location,
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: BikesImage(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  photoUrl: state.bike.photoUrl
                )
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
                child: Text(state.bike.description, 
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