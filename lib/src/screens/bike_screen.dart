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
            children: <Widget>[
              BikesCard(
                data: state.data,
                type: BikesCardType.vertical,
                onDelete: () => Navigator.pop(context),
              ),
              state.data.description.isEmpty
              ? SizedBox()
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                  ]
                )
              )
            ],
          );
        }
      )
    );
  }
}