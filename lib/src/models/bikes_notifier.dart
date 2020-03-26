import 'dart:convert';

import 'package:bikes/shelf.dart';
import 'package:flutter/widgets.dart';

class BikesNotifier extends ChangeNotifier{
  BikesNotifier({
    @required this.context
  }) : assert(context != null);

  BuildContext context;

  List<Bike> _data = [];
  List<Bike> get data => _data;

  Bike _bike;
  Bike get bike => _bike;

  bool _loading = false;
  bool get loading => _loading;

  void init() async{
    _loading = true;
    notifyListeners();

    String _dataBikes = await DefaultAssetBundle.of(context).loadString("assets/ISBikesData.json");
    List<dynamic> _dataBikesList = json.decode(_dataBikes);

    _dataBikesList.forEach((dynamic _dataBikesMap){
      _data.add(Bike.fromJson(_dataBikesMap));
    });

    _loading = false;
    notifyListeners();
  }
}