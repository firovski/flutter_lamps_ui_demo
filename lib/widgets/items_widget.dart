import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/pages/item_details_screen.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';

class ItemWidget extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final List lamps;
  final double offset;


  const ItemWidget(
      {Key key, this.pageController, this.currentPage, this.lamps, this.offset,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));

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

                  Transform.translate(
                    offset: Offset(-32 * gauss * offset.sign, 0),
                    child: Hero(
                      tag: lamps[currentPage].imagePath,
                      child: Image(
                        image: AssetImage(lamps[currentPage].imagePath
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-32 * gauss * offset.sign, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: lamps[currentPage].price,
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
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 20,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Transform.translate(
                            offset: Offset(-32 * gauss * offset.sign, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Hero(
                                  tag: 'item_title${lamps[currentPage].name}',
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      child: Text(
                                        lamps[currentPage].name,
                                        style: AppTheme.heading,
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(-32 * gauss * offset.sign, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Hero(
                                            tag: 'item_desc${lamps[currentPage]
                                                .name}',
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Container(
                                                child: Text(
                                                  "Tap to Read more",
                                                  style: AppTheme.subHeading,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Hero(
                                            tag: 'price_tag${lamps[currentPage]
                                                .price}',

                                            child: Material(
                                              color: Colors.transparent,
                                              child: Container(
                                                child: Text(
                                                  lamps[currentPage].price,
                                                  style: AppTheme.subHeading,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                  ),
                                ),
                              ],
                            ),
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
