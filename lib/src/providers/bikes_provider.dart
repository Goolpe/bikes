import 'dart:convert';

import 'package:bikes/index.dart';
import 'package:flutter/widgets.dart';

class BikesProvider extends ChangeNotifier{
  BikesProvider({
    @required this.context
  }) : assert(context != null);

  final BuildContext context;

  List<Bike> _bikes = [];
  List<Bike> get bikes => _bikes;

  Bike _bike;
  Bike get bike => _bike;

  bool _fetchingBikes = false;
  bool get fetchingBikes => _fetchingBikes;

  bool _fetchingBike = false;
  bool get fetchingBike => _fetchingBike;

  void init() async{
    _fetchingBikes = true;
    notifyListeners();

    String _dataBikes = await DefaultAssetBundle.of(context).loadString("assets/ISBikesData.json");
    List<dynamic> _dataBikesList = json.decode(_dataBikes);

    _dataBikesList.forEach((dynamic _dataBikesMap){
      _bikes.add(Bike.fromJson(_dataBikesMap));
    });

    _fetchingBikes = false;
    notifyListeners();
  }

  void fetchBike(int id){
    _fetchingBike = true;
    notifyListeners();

    _bike = _bikes.firstWhere(
      (Bike _dataBikesMap) => _dataBikesMap.id == id);

    _fetchingBike = false;
    notifyListeners();
  }

  void addBike(Bike data){
    data.id = DateTime.now().millisecondsSinceEpoch;
    _bikes.add(data);
  }
}