import 'package:flutter/material.dart';
import 'package:tou_caro_app/screens/user_location_screen.dart';

import '../app_styles.dart';

class SuccesSignupScreen extends StatefulWidget {
  const SuccesSignupScreen({Key key}) : super(key: key);

  @override
  _SuccesSignupScreenState createState() => _SuccesSignupScreenState();
}

class _SuccesSignupScreenState extends State<SuccesSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFBDA12), kSecondaryColor])),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UserLocationScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kfirstColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Color(0xFFFBDA12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                       
                        Icon(Icons.thumb_up_alt_outlined, size: 100, color: kPrimaryColor),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Votre compte a été crée avec succès".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: textStyle),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Merci d'avoir pris le temps de créer votre compte chez TouCaro. Maintenant, commander votre prémier trajet",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 60,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UserLocationScreen()));
                              },
                              child: Text('COMMANDER',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                primary: kPrimaryColor,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
