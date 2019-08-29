import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/styleguide.dart';

class AnimatedButton extends StatefulWidget {
  final String price;

  AnimatedButton(this.price);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
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
        padding: EdgeInsets.only(left: 20.0, right: 30, top: 8, bottom: 8),
        child: Row(
          children: <Widget>[
            Hero(
              tag: 'price_tag_text_${widget.price}',
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
      );
}
