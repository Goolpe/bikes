import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BikeProvider extends ChangeNotifier{

  Bike _data;
  Bike get data => _data;

  bool _fetchingData = false;
  bool get fetchingData => _fetchingData;

  void fetchBike(BuildContext context, int id){
    //start loading of data fetching
    _fetchingData = true;
    notifyListeners();

    _data = id == null 
    ? Bike()
    : Provider.of<BikesProvider>(context, listen: false).fetchBike(id);

    //finish loading of data fetching
    _fetchingData = false;
    notifyListeners();
  }
}