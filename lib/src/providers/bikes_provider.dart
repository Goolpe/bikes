import 'dart:convert';

import 'package:bikes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class BikesProvider extends ChangeNotifier{
  BikesProvider({
    @required this.context
  }) : assert(context != null);

  final BuildContext context;

  List<Bike> _dataList = [];
  List<Bike> get dataList => _dataList;

  bool _fetchingDataList = false;
  bool get fetchingDataList => _fetchingDataList;

  //initialization of bikes provider
  void init() async{

    //start loading of data fetching
    _fetchingDataList = true;
    notifyListeners();

    //fetch and decode json file
    try{
      String _dataJson = await DefaultAssetBundle.of(context).loadString("assets/ISBikesData.json");
      List<dynamic> _newDataList = json.decode(_dataJson) as List<dynamic>;

      //transfer json to bike model
      _newDataList.forEach((dynamic _dataListMap){
        _dataList.add(Bike.fromJson(_dataListMap));
      });
    } catch(_){}

    //finish loading of data fetching
    _fetchingDataList = false;
    notifyListeners();
  }

  Bike fetchBike(int id){
    //find and return data by id
    return _dataList.firstWhere(
      (Bike value) => value.id == id);
  }

  void addBike(Bike newData){
    //create and add to list new id
    newData.id = DateTime.now().millisecondsSinceEpoch;
    _dataList.add(newData);
    notifyListeners();
  }

  void editBike(Bike newData, int id){
    // find and replace data by id
    _dataList.asMap().forEach((int i, Bike value){
      if(value.id == id) _dataList[i] = newData;
    });
    notifyListeners();
  }

  void removeBike(int id){
    // find and remove data by id
    _dataList.removeWhere((Bike bike) => id == bike.id);
    notifyListeners();
  }
}