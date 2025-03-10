import 'package:flutter/material.dart';

class FloatAnimation extends StatefulWidget {
  final Widget child;

  const FloatAnimation({super.key, required this.child});

  @override
  State<StatefulWidget> createState() {
    return _FloatAnimation();
  }
}

class _FloatAnimation extends State<FloatAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late final Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.08),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
