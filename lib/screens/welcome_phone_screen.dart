import 'package:flutter/material.dart';

import '../app_styles.dart';

class WelcomeScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      
      body: Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFBDA12),
              Color(0xFF161421),
            ]),
      ),
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: MediaQuery.of(context).size.height* 0.1),
            
            Image.asset("images/Shape.png"),
            SizedBox(height: 20,),
            Text("Prêt à y aller ?", style: textStyle,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.center,
                child: Center(
                    child: Text(
                  "Merci d'avoir pris le temps pour créer votre compte chez TouCaro. Maintenant, commandez votre premier trajet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                )
                ),
                 Container(height: MediaQuery.of(context).size.height * 0.05),

              Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => null,
                child: Text('Commander',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
    ));
  }
}
