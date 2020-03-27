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
      Provider.of<BikeProvider>(context, listen: false)
        .fetchBike(context, widget.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BikesScaffold(
      body: Consumer<BikeProvider>(
        builder: (BuildContext context, BikeProvider state, _){
          if(state.fetchingData
            || state.data == null 
            || state.data.id != widget.id
          ){
            return SizedBox();
          }
          return ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              BikesListTile(
                title: state.data.name ?? '',
                id: widget.id,
                fontSize: 24,
                onDelete: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    BikesRichText(
                      label1: 'Frame Size: ',
                      label2: state.data.frameSize ?? '',
                    ),
                    SizedBox(width: 24),
                    BikesRichText(
                      label1: 'Price Range: ',
                      label2: state.data.priceRange ?? '',
                    ),
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BikesBadge(label: state.data.category)
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Text(state.data.location,
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
                  photoUrl: state.data.photoUrl
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text('Description'.toUpperCase(), 
                  style: Theme.of(context).textTheme.body2.copyWith(
                    fontWeight: FontWeight.bold, 
                    letterSpacing: 1.2,
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(state.data.description, 
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