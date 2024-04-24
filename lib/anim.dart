import 'package:flutter/material.dart';

class AnimatedFlower extends StatefulWidget {
  @override
  _AnimatedFlowerState createState() => _AnimatedFlowerState();
}

class _AnimatedFlowerState extends State<AnimatedFlower> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.1415,
          child: Icon(
            Icons.flare,
            size: 100,
            color: Colors.yellow,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}