import 'package:flutter/material.dart';
import '../screens/succes_signup_screen.dart';
import 'welcome_phone_screen.dart';
import '../app_styles.dart';
import '../widgets/user_text_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();

  void _saveForm() {
    var isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => WelcomeScreenOne()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                            Text("Terminer votre", style: textStyle),
                            Text("enregistrement", style: textStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NOM",
                                style: TextStyle(color: kSecondaryColor)),
                            Container(
                              height: 5,
                            ),
                            UserTextForm(
                              label: "John",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PRENOM",
                              style: TextStyle(color: kSecondaryColor)),
                          Container(
                            height: 5,
                          ),
                          UserTextForm(
                            label: "Doe",
                          ),
                        ],
                      )),
                    ],
                  ),
                  Container(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-MAIL",
                            style: TextStyle(color: kSecondaryColor)),
                        Container(
                          height: 5,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _emailController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Renseignez ce champ';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'Saisissez une address email valide';
                            }
                            return null;
                          },
                          onSaved: (data) {
                            print(data);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'john.doe@gmail.com',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: new IconButton(
                                  //_emailController.text.length > 0

                                  icon: new Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      _emailController.clear();
                                    });
                                  })
                              // : new Container(
                              //     child: Text(""),
                              //   )
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MOT DE PASSE",
                            style: TextStyle(color: kSecondaryColor)),
                        Container(
                          height: 5,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Renseignez ce champ";
                            }
                            return null;
                          },
                          onSaved: (data) {
                            print(data);
                          },
                          decoration: InputDecoration(
                            hintText: '*********',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                // _saveForm();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SuccesSignupScreen()));
              },
              child: Text('Sauvegarder',
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
            ),
            ),
      ),
    );
  }
}
