import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/pages/item_details_screen.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';

class ItemWidget extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final List lamps;


  const ItemWidget(
      {Key key, this.pageController, this.currentPage, this.lamps,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) =>
                    ItemDetailsScreen(item: lamps[currentPage],)));
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          }

          return new ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  /*Align(
                  alignment: Alignment(0, -0.5),
                  child: Hero(
                    tag: "image-1",
                    child: Image.asset(
                      "",
                      height: screenHeight * 0.55 * value,
                    ),
                  ),
                ),*/

                  Image(
                    image: AssetImage(lamps[currentPage].imagePath
                    ),
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      elevation: 2,
                      color: Colors.transparent,
                      child: Container(
                        height: 70,
                        //color: Color(0xff142626).withOpacity(0.6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey.withOpacity(0.6),
                              Color(0xff142626).withOpacity(0.8)
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 20,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  lamps[currentPage].name,
                                  style: AppTheme.heading,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "Tap to Read more",
                                          style: AppTheme.subHeading,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          lamps[currentPage].price,
                                          style: AppTheme.subHeading,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
