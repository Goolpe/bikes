import 'package:bikes/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BikesProvider>(
          create: (_) => BikesProvider(context: context)..init()
        ),
        ChangeNotifierProvider<BikeProvider>(
          create: (_) => BikeProvider()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bikes',
        theme: _theme(),
        builder: (BuildContext context, Widget child) {
          //remove overscroll animation
          return ScrollConfiguration(
            behavior: BikesOverScrollBehavior(),
            child: child
          );
        },
        home: HomeScreen()
      )
    );
  }

  ThemeData _theme(){
    return ThemeData(
      primaryColor: COLOR_PRIMARY,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        body1: TextStyle(color: COLOR_PRIMARY_TEXT),
        body2: TextStyle(color: COLOR_PRIMARY_TEXT, fontFamily: FONT_IBM),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black
          )
        )
      )
    );
  }
}