import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/pages/dashboard_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: Color(0xff142626),
          canvasColor: Colors.white,
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.white)),
      home: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            //HomeScreen(),
            //GuillotineMenu(),
            DashBoardScreen(),

          ],

        ),
      ),
    );
  }
}
