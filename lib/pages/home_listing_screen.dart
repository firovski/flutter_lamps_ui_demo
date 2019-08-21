import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';
import 'package:flutter_lamps_ui_demo/widgets/items_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int currentPage = 0;

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
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.shopping_basket,
              size: 30,
            ),
          )
        ],
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
                    roundedContainer(),
                    SizedBox(width: 20),
                    roundedContainer(),
                    SizedBox(width: 20),
                    roundedContainer(),
                    SizedBox(width: 20),
                    roundedContainer(),
                    SizedBox(width: 20),
                    roundedContainer(),
                    SizedBox(width: 20),
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
                          RotatedBox(
                            quarterTurns: 3,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Offers",
                                          style: AppTheme.menuHeadingActive,
                                        ),
                                        Icon(
                                          Icons.brightness_1,
                                          color:
                                              Colors.black26.withOpacity(0.8),
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "New Collection",
                                          style: AppTheme.menuHeadingInactive,
                                        ),
                                        Icon(
                                          Icons.brightness_1,
                                          color: Colors.grey.withOpacity(0.8),
                                          size: 14,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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
                            i < 6;
                            i++)
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 4.0),
                                    blurRadius: 14.0,
                                  )
                                ],
                                color: Colors.blueGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              width: (screenWidth / 3) * 1.8,
                              child: ItemWidget(
                                  pageController: _pageController,
                                  currentPage: i),
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

  Widget roundedContainer() {
    return GestureDetector(
      onTap: () {},
      child: Material(
        color: Colors.transparent,
        elevation: 8,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                offset: Offset(0, 12.0),
                blurRadius: 14.0,
              )
            ],
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
