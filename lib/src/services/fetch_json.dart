import 'package:flutter/services.dart' show rootBundle;

Future<String> fetchJson() async{
  try{
    return await rootBundle.loadString('assets/ISBikesData.json');
  } catch(err){
    throw err;
  }
}