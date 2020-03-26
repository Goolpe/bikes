import 'package:bikes/shelf.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      Provider.of<BikeNotifier>(context, listen: false).init(id: widget.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/logo.svg',
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Consumer<BikeNotifier>(
        builder: (BuildContext context, BikeNotifier state, _){
          if(state.loading || state.data == null){
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
                        child: Text(state.data.name.toUpperCase(), 
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
                    InkWell(
                      child: Icon(Icons.more_vert),
                      onTap: (){},
                    )
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
                child: true ? Container(
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
                : CachedNetworkImage(
                  imageUrl: state.data.photoUrl,
                ),
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