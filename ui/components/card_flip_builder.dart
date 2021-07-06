import 'package:flutter/material.dart';
import 'dart:math';

class CardFlipBuilder extends StatefulWidget {
  const CardFlipBuilder({
    Key? key,
    required this.frontBuilder,
    required this.backBuilder,
  }) : super(key: key);
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  CardFlipBuilderState createState() => CardFlipBuilderState();
}

class CardFlipBuilderState extends State<CardFlipBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFrontCard = true;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _controller.addStatusListener(_updateStatus);
    // _controller
    //   ..addListener(() {
    //     print('${_controller.value}');
    //   });
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();

    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() {
        _isFrontCard = !_isFrontCard;
      });
    }
  }

  void flip() {
    if (_isFrontCard) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    //return widget.backBuilder(context);
    return AnimatedCardFlipBuilder(
        animation: _controller,
        isfrontCard: _isFrontCard,
        frontBuilder: widget.frontBuilder,
        backBuilder: widget.backBuilder);
  }
}

class AnimatedCardFlipBuilder extends StatelessWidget {
  const AnimatedCardFlipBuilder(
      {required this.animation,
      required this.isfrontCard,
      required this.frontBuilder,
      required this.backBuilder,
      Key? key})
      : super(key: key);

  final Animation<double> animation;
  final bool isfrontCard;
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final isHalfAnimation = animation.value.abs() < 0.5;
          final child =
              isHalfAnimation ? frontBuilder(context) : backBuilder(context);
          final rotationValue = animation.value * pi;
          final rotationAngle =
              animation.value > 0.5 ? (pi - rotationValue) : rotationValue;
          var tilt = (animation.value - 0.5).abs() - 0.5;
          tilt = animation.value < -0.5 ? 1 + animation.value : tilt;
          tilt *= isHalfAnimation ? -0.003 : 0.003;
          final absValue = animation.value.abs();
          final scale = 1 - (absValue < 0.5 ? absValue : 1 - absValue) * 0.2;
          return Transform(
            transform: (Matrix4.rotationX(rotationAngle)
                  ..setEntry(3, 1, tilt)) *
                Matrix4.diagonal3Values(scale, scale, 1),
            child: child,
            alignment: Alignment.center,
          );
        });
  }
}
