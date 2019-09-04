import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/models/menu_items.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';
import 'package:flutter_lamps_ui_demo/widgets/animated_button_widget.dart';

class ItemDetailsScreen extends StatefulWidget {
  final Lamp item;

  const ItemDetailsScreen({Key key, this.item}) : super(key: key);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          //color: Color(0xff142626),
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.4, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Color(0xff142626),
                Colors.blueGrey,


              ],
            ),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: (MediaQuery
                    .of(context)
                    .size
                    .height / 3) * 1.5,
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  background:
                  Hero(
                      tag: widget.item.imagePath,
                      child: Image.asset(
                          widget.item.imagePath, fit: BoxFit.cover)),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Hero(
                      tag: 'item_title${widget.item.name}',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          color: Colors.transparent,
                          height: 60,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  widget.item.name,
                                  style: AppTheme.heading,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'item_desc${widget.item.name}',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          color: Colors.transparent,
                          height: 400,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(20, 0, 20, 100),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        child: Text(
                                          widget.item.description,
                                          style: AppTheme.headingdesc,
                                          textAlign: TextAlign.left,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 45,
          right: 30,
          child: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedButton(widget.item.price),
              /*Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff28CF75).withOpacity(0.4),
                      //color: Colors.lightGreenAccent.withOpacity(0.4),
                      offset: Offset(0, 2.0),
                      blurRadius: 2.0,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding:
                    EdgeInsets.only(left: 20.0, right: 30, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'price_tag_text',

                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            "Buy",
                            style: AppTheme.buttonTextAddToBasket,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Hero(
                      tag: 'price_tag',
                      child: Icon(
                        Icons.shopping_basket,
                        color: Color(0xff142626),
                        size: 22,
                      ),
                    )
                  ],
                ),
              ),*/
            ),
          ),
        ),
      ],
    );
  }
}
