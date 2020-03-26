import 'package:bikes/shelf.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IS-Bikes'),
        centerTitle: true,
      ),
      body: Consumer<Bikes>(
        builder: (BuildContext context, Bikes state, _){
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (BuildContext context, int i){
              return Card(
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: state.data[i].photoUrl,
                    )
                  ],
                ),
              );
            }
          );
        }
      )
    );
  }
}