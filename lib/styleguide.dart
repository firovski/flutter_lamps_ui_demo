import 'package:flutter/material.dart';

class AppTheme {
  static const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Color(0xff142626),
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static final TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.white.withOpacity(0.8),
    letterSpacing: 1.2,
  );
  static final TextStyle headingdesc = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.white.withOpacity(0.8),
    letterSpacing: 1.2,
  );

  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w100,
    fontSize: 12,
    color: Colors.white.withOpacity(0.8),
  );
  static final TextStyle menuHeadingActive = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Color(0xff142626).withOpacity(0.8),
  );
  static final TextStyle menuHeadingInactive = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.blueGrey.withOpacity(0.6),
  );

  static final TextStyle buttonTextAddToBasket = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w600,
    fontSize: 22,
    color: Color(0xff142626),
  );


  static final primaryColor = const Color(0xff142626);
}
