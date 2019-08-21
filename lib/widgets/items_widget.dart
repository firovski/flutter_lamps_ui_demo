import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';

class ItemWidget extends StatelessWidget {
  final PageController pageController;
  final int currentPage;

  const ItemWidget({Key key, this.pageController, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        /*Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) =>
                    CharacterDetailsScreen(character: character)));*/
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
                    image: AssetImage('assets/images/lamp.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Chandelier",
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
                                        "£ 39.99",
                                        style: AppTheme.subHeading,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ],
                        ),
                      )
                    ],
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
