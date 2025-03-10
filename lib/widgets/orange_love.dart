import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterflow/helpers/float_animation.dart';
import 'package:waterflow/helpers/flow_animation.dart';

class OrangeLove extends StatelessWidget {
  const OrangeLove({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                projectTitle,
                SizedBox(height: size.height * 0.1),
                FloatAnimation(
                  key: UniqueKey(),
                  child: Transform.rotate(
                    angle: 0,
                    child: Image.asset(
                      'assets/images/orange_fruit.png',
                      width: size.width * 0.7,
                      height: size.width * 0.7,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlowAnimation(
              key: UniqueKey(),
              color: Colors.orange.shade700,
              height: size.height * 0.4,
            ),
          )
        ],
      ),
    );
  }

  LinearGradient get primaryGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.grey,
        Colors.grey.shade600,
        Colors.grey.shade700,
        Colors.grey.shade800,
        Colors.grey.shade900,
        Colors.black,
        Colors.black,
      ],
    );
  }

  Widget get projectTitle {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Text(
          'I Love Orange',
          style: GoogleFonts.playball(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: constraints.maxWidth * 0.08,
              ),
              shadows: [
                const Shadow(
                  color: Colors.orangeAccent,
                  blurRadius: 10,
                  offset: Offset(1, 3),
                )
              ]),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
