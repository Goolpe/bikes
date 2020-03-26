import 'dart:convert';

import 'package:bikes/shelf.dart';
import 'package:flutter/widgets.dart';

class BikeNotifier extends ChangeNotifier{
  BikeNotifier({
    this.bikes
  });

  List<Bike> bikes;

  Bike _data;
  Bike get data => _data;

  bool _loading = false;
  bool get loading => _loading;

  void init({
    @required  int id
  }) async{
    _loading = true;
    notifyListeners();

    _data = bikes.firstWhere((dynamic _dataBikesMap) => _dataBikesMap['id'] == id);
    
    _loading = false;
    notifyListeners();
  }
}