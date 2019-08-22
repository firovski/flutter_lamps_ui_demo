import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/models/menu_items.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';
import 'package:flutter_lamps_ui_demo/widgets/items_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int currentPage = 0;
  int currentMenu = 0;
  List lampsContent = Lamps;
  List lampsContentTemp = Lamps;
  bool modeState = true;
  final List<String> catalogPath = [
    "assets/images/lamp2.png",
    "assets/images/lamp1.png",
    "assets/images/lamp3.jpg",
    "assets/images/lamp4.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Color(0xff142626),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.shopping_basket,
              size: 30,
              color: Color(0xff142626),

            ),
          )
        ],
      ),
      bottomNavigationBar: Material(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Color(0xff142626),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.rss_feed),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              ),
              Tab(
                icon: new Icon(Icons.settings),
              )
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blueGrey.withOpacity(0.6),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "What you would", style: AppTheme.display2),
                      TextSpan(text: "\n"),
                      TextSpan(text: "like to", style: AppTheme.display2),
                      TextSpan(text: " find", style: AppTheme.display1),
                      TextSpan(text: " ?", style: AppTheme.display2),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 30, bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i = 0; // ignore: sdk_version_ui_as_code
                    i < catalogPath.length;
                    i++) // ignore: sdk_version_ui_as_code
                      (currentMenu == i)
                          ? roundedContainer(
                          catalogPath[i],
                          Color(0xff142626).withOpacity(0.9),
                          Colors.white,
                          i)
                          : roundedContainer(catalogPath[i], Colors.white,
                          Color(0xff142626).withOpacity(0.9), i)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: (screenWidth / 3) * 0.8,
                    height: (screenHeight / 3) * 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                modeState = !modeState;
                                lampsContent = lampsContentTemp;
                                currentPage = 0;
                              });
                            },
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "Offers",
                                            style: modeState
                                                ? AppTheme.menuHeadingActive
                                                : AppTheme.menuHeadingInactive,
                                          ),
                                          Icon(
                                            Icons.brightness_1,
                                            color: modeState
                                                ? AppTheme.primaryColor
                                                .withOpacity(0.8)
                                                : Colors.white,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                modeState = !modeState;
                                //sublist
                                lampsContent = new List.from(
                                    lampsContentTemp.where((i) =>
                                        Random.secure().nextBool()));
                                currentPage = 0;
                              });
                            },
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "New Collection",
                                            style: !modeState
                                                ? AppTheme.menuHeadingActive
                                                : AppTheme.menuHeadingInactive,
                                          ),
                                          Icon(
                                            Icons.brightness_1,
                                            color: !modeState
                                                ? AppTheme.primaryColor
                                                .withOpacity(0.8)
                                                : Colors.white,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      children: <Widget>[
                        for (var i = 0; // ignore: sdk_version_ui_as_code,
                        i < lampsContent.length;
                        i++)
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 4.0),
                                    blurRadius: 14.0,
                                  )
                                ],
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              width: (screenWidth / 3) * 1.8,
                              child: ItemWidget(
                                pageController: _pageController,
                                currentPage: i,
                                lamps: lampsContent,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget roundedContainer(String url, Color bgColor, Color iconColor,
      int index) {
    List temp;
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            temp = Lamps;
            break;
          case 1:
            temp = LampsDesck;
            break;
          case 2:
            temp = Lamps;
            break;
          case 3:
            temp = Lamps;
            break;
        }
        setState(() {
          currentMenu = index;
          lampsContent = temp;
          lampsContentTemp = temp;
          currentPage = 0;
          modeState = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Material(
          color: Colors.transparent.withOpacity(0),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff28CF75).withOpacity(0.4),
                  //color: Colors.lightGreenAccent.withOpacity(0.4),
                  offset: Offset(0, 8.0),
                  blurRadius: 8.0,
                )
              ],
              color: bgColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(image: AssetImage(url), color: iconColor),
            ),
          ),
        ),
      ),
    );
  }
}
