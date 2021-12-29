import 'package:flutter/material.dart';
import '../app_styles.dart';

class EnterOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
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
                    Text("Vérifier", style: textStyle),
                    Text("votre numéro", style: textStyle),
                    SizedBox(height: 15),
                    Text(
                      "Consulter votre messagerie sms. Un code",
                      style: textSubStyle,
                    ),
                    RichText(
                      text: TextSpan(text: "", children: <TextSpan>[
                        TextSpan(
                          text: "PIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " a été envoyé au ",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: " 0707088586. ",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPDigitTextFieldBox(first: true, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: true),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Message non envoyé ?", style: textSubStyle,),
                     
                      FittedBox(
                        child: TextButton(onPressed: (){}, child: Text("Renvoyer le code", style: TextStyle(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold))
                  ),
                      )],),
                  
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 70,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('VERIFIER',
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
          )
        ]),
      ),
    ));
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  const OTPDigitTextFieldBox(
      {Key key, @required this.first, @required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          //style: MyStyles.inputTextStyle,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(0),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5)),
            hintText: "*",
            // hintStyle: MyStyles.hintTextStyle,
          ),
        ),
      ),
    );
  }
}
