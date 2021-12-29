import 'package:flutter/material.dart';
import './size_configs.dart';

Color kPrimaryColor = const Color(0xFFFBDA12);
Color kSecondaryColor = Colors.grey;
Color kfirstColor = const Color(0xFF161421);

//Color(0xFF161421),

const textStyle = TextStyle(
  fontSize: 32,
  color: Color(0xFF161421),
  fontWeight: FontWeight.bold,
);

const textSubStyle = TextStyle(
  fontSize: 16,
  color: Color(0xFF161421),
  fontWeight: FontWeight.bold,
   
);

final kTitle = TextStyle(
  //fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH * 9,
  color: kfirstColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
);

final kSubTitle = TextStyle(
  //fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH * 4,
  color: kSecondaryColor,
  fontFamily: 'Montserrat',
);

final kfirstColorStyle = TextStyle(
  //fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH * 4,
  color: kfirstColor,
  fontFamily: 'Montserrat',
);

final kBodyText1 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH * 5.5,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
);
