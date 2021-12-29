// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tou_caro_app/screens/welcome_loc_screen.dart';
import '../app_styles.dart';
import '../screens/page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                
                
                Image.asset("images/logo.png"),
               
                Container(
                  width: double.infinity,
                  child: Image.asset("images/welcome.png", fit: BoxFit.cover,)),
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                   
                    Text("Bienvenue sur",
                        style: textStyle),
                    Center(
                      child: Text("TouCaro !",
                          style: textStyle),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        alignment: Alignment.center,
                        child: Center(
                            child: Text(
                          "La plate-forme #1 de Véhicule de Tourisme avec Chauffeur 100% ivoirienne.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                        ))),
                    // Commande with phone buttton

                    Container(
                        height: 70,
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => cmdWithPhone(context),
                          label: Text('COMMANDER AVEC SON TELEPHONE',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          icon: Icon(Icons.phone),
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
                    // Commande with location button
                    Container(
                        height: 70,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: OutlinedButton.icon(
                          icon: Icon(Icons.near_me_sharp, color: Colors.black),
                          label: Text("COMMANDER AVEC SA LOCALISATION",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () => cmdWithLocation(context),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: kPrimaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )),
      ])),
    );
  }

  void cmdWithPhone(context) {
    print('Elevated Button Clicked...');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpPage()));
  }

  void cmdWithLocation(context) {
    print('Outline button Button Clicked...');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => WelcomeLocScreen()));

    //WelcomeLocScreen
  }
}
