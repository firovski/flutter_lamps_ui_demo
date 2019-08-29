import 'package:flutter/material.dart';
import 'package:flutter_lamps_ui_demo/widgets/items_widget.dart';

class AnimatedPageViewItem extends StatefulWidget {
  final PageController pageController;
  final int currentPage;
  final List lamps;

  const AnimatedPageViewItem(
      this.pageController, this.currentPage, this.lamps, double pageOffset);

  @override
  _AnimatedPageViewItemState createState() => _AnimatedPageViewItemState();
}

class _AnimatedPageViewItemState extends State<AnimatedPageViewItem>
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

  Widget get _animatedButtonUI => ItemWidget(
        pageController: widget.pageController,
        currentPage: widget.currentPage,
        lamps: widget.lamps,
      );
}
