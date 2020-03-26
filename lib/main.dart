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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bikes',
        theme: ThemeData(
          primaryColor: Color(0xff00E1AA),
          scaffoldBackgroundColor: Color(0xffF0F1F5),
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
        ),
        builder: (BuildContext context, Widget child) {
          return ScrollConfiguration(
            behavior: BikesOverScrollBehavior(),
            child: child
          );
        },
        home: HomeScreen()
      )
    );
  }
}