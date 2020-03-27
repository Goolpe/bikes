import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<BikesProvider>(
      builder: (BuildContext context, BikesProvider state, _){
        if(state.fetchingDataList){
          return SizedBox();
        } else if(state.dataList.isEmpty){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('No Bikes here, add a new one or'),
                BikesButton(
                  label: 'Fetch from json file',
                  onPressed: () => 
                    Provider.of<BikesProvider>(context, listen: false).init(),
                )
              ]
            )
          );
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 4, bottom: 70),
          itemCount: state.dataList.length,
          itemBuilder: (BuildContext context, int i){
            return BikesCard(
              data: state.dataList[i],
              onTap: (){
                if(state.dataList[i].id != null){
                  Navigator.push<Widget>(
                    context, CupertinoPageRoute(
                      builder: (context) => BikeScreen(id: state.dataList[i].id)
                    )
                  );
                }
              },
            );
          }
        );
      }
    );
  }
}