import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterflow_animation/float_animation.dart';
import 'package:waterflow_animation/flow_animation.dart';

class SplashPageScarletWitch extends StatefulWidget {
  const SplashPageScarletWitch({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashPageScarletWitch();
  }
}

class _SplashPageScarletWitch extends State<SplashPageScarletWitch> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Container(
        decoration: BoxDecoration(gradient: primaryGradient),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  projectTitle,
                  SizedBox(height: size.height * 0.05),
                  FloatAnimation(
                    key: UniqueKey(),
                    child: Transform.rotate(
                      angle: 0,
                      child: Image.asset(
                        'assets/images/scarlet_witch1.png',
                        width: size.width * 0.8,
                        height: size.width * 0.8,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FlowAnimation(
                key: UniqueKey(),
                color: Colors.black,
                height: size.height * 0.4,
              ),
            )
          ],
        ),
      ),
    );
  }

  LinearGradient get primaryGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.indigo.shade900,
        Colors.indigo.shade900,
        Colors.deepPurple,
        Colors.redAccent,
        Colors.deepOrange,
        Colors.black,
      ],
    );
  }

  Widget get projectTitle {
    return LayoutBuilder(
      builder: (context, constraints) {
        final logoSize = constraints.maxWidth * 0.125;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/knight_logo.png',
              width: logoSize,
              height: logoSize,
            ),
            const SizedBox(width: 10),
            Text(
              'Scarlet Witch',
              style: GoogleFonts.playball(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.08,
                  ),
                  shadows: [
                    const Shadow(
                      color: Colors.red,
                      blurRadius: 10,
                      offset: Offset(1, 3),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
