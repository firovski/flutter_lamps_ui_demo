import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/models/menu_items.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';

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
          color: Color(0xff142626),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: (MediaQuery.of(context).size.height / 3) * 2,
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      Image.asset(widget.item.imagePath, fit: BoxFit.cover),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        color: Colors.transparent,
                        height: 60,
                        child: Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                widget.item.name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                                      textAlign: TextAlign.justify,
                                    ),
                                  )),
                            ),
                          ),
                        ],
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
          right: 20,
          child: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      //color: Colors.lightGreenAccent.withOpacity(0.4),
                      offset: Offset(0, 2.0),
                      blurRadius: 2.0,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding:
                    EdgeInsets.only(left: 20.0, right: 30, top: 12, bottom: 12),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Buy",
                      style: AppTheme.buttonTextAddToBasket,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.shopping_basket,
                      color: Color(0xff142626),
                      size: 22,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
