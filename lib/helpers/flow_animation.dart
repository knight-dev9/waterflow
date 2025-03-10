import 'package:flutter/material.dart';
import 'dart:async';
import 'flow_painter.dart';

class FlowAnimation extends StatefulWidget {
  final Color color;
  final double height;
  final Duration duration;

  const FlowAnimation({
    super.key,
    required this.color,
    required this.height,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<StatefulWidget> createState() {
    return _FlowAnimation();
  }
}

class _FlowAnimation extends State<FlowAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> animation1;

  late AnimationController controller2;
  late Animation<double> animation2;

  late AnimationController controller3;
  late Animation<double> animation3;

  late AnimationController controller4;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(vsync: this, duration: widget.duration);
    animation1 = Tween<double>(begin: 1.5, end: 2.1)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setStateIfMounted(() {});
      })
      ..addStatusListener((status) {
        if (!mounted) {
          return;
        }
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller2 = AnimationController(vsync: this, duration: widget.duration);
    animation2 = Tween<double>(begin: 1.4, end: 2.4)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setStateIfMounted(() {});
      })
      ..addStatusListener((status) {
        if (!mounted) {
          return;
        }
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller3 = AnimationController(vsync: this, duration: widget.duration);
    animation3 = Tween<double>(begin: 1.4, end: 2.4)
        .animate(CurvedAnimation(parent: controller3, curve: Curves.easeInOut))
      ..addListener(() {
        setStateIfMounted(() {});
      })
      ..addStatusListener((status) {
        if (!mounted) {
          return;
        }
        if (status == AnimationStatus.completed) {
          controller3.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller3.forward();
        }
      });

    controller4 = AnimationController(vsync: this, duration: widget.duration);
    animation4 = Tween<double>(begin: 1.5, end: 2.1)
        .animate(CurvedAnimation(parent: controller4, curve: Curves.easeInOut))
      ..addListener(() {
        setStateIfMounted(() {});
      })
      ..addStatusListener((status) {
        if (!mounted) {
          return;
        }
        if (status == AnimationStatus.completed) {
          controller4.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller4.forward();
        }
      });

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        controller1.forward();
      }
    });
    Timer(const Duration(milliseconds: 1600), () {
      if (mounted) {
        controller2.forward();
      }
    });
    Timer(const Duration(milliseconds: 800), () {
      if (mounted) {
        controller3.forward();
      }
    });
    if (mounted) {
      controller4.forward();
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: FlowPainter(
            firstValue: animation1.value,
            secondValue: animation2.value,
            thirdValue: animation3.value,
            fourthValue: animation4.value,
            color: widget.color,
          ),
          child: SizedBox(
            width: constraints.maxWidth,
            height: widget.height,
          ),
        );
      },
    );
  }
}

extension StateX on State {
  void setStateIfMounted(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    }
  }
}
