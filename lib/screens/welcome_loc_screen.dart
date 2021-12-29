import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../screens/code_verify_screen.dart';

import '../app_styles.dart';

class WelcomeLocScreen extends StatefulWidget {
  @override
  _WelcomeLocScreenState createState() => _WelcomeLocScreenState();
}

class _WelcomeLocScreenState extends State<WelcomeLocScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios))
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Quel est votre", style: textStyle),
                          Text("numéro ?", style: textStyle),
                          SizedBox(height: 8),
                          Text("un sms de vérification vous sera"),
                          Text("envoyé pour la validation de votre"),
                          Text("compte"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Numéro de téléphone',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'CI',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (phone) {
                    print('Country code changed to: ' + phone.countryCode);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 70,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EnterOTP()));
                      },
                      child: Text('CONTINUER',
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
      ),
    );
  }
}
