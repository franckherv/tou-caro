import 'package:flutter/material.dart';

import '../app_styles.dart';

class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key key,
    @required this.name,
    @required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32.0),
    ),
  ),
    child: Text(name, style: kfirstColorStyle,),
    onPressed: onPressed,
  );
  }
}