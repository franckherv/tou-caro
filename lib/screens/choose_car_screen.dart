import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:provider/provider.dart';
import 'package:tou_caro_app/providers/car_info_provider.dart';
import 'package:tou_caro_app/screens/paid_screen.dart';

import '../app_styles.dart';

enum AuthMode { FirstPage, SecondPage, thirPage }

class ChooseCarScreen extends StatefulWidget {
  final String userPosition;
  const ChooseCarScreen({@required this.userPosition});

  @override
  _ChooseCarScreenState createState() => _ChooseCarScreenState();
}

class _ChooseCarScreenState extends State<ChooseCarScreen> {
  AuthMode _authMode = AuthMode.SecondPage;

  bool isScrolable = false;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final choise = Provider.of<InfoCarProvider>(context).items;
    final deviceSize = MediaQuery.of(context).size;

    void _switchAuthMode() {
      print("======$_authMode=========");

      if (_authMode == AuthMode.SecondPage) {
        setState(() {
          _authMode = AuthMode.FirstPage;
        });
      } else {
        setState(() {
          _authMode = AuthMode.SecondPage;
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(
                "images/Bitmap.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2017/04/01/21/06/portrait-2194457__480.jpg',
                ),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.3,
              initialChildSize: _authMode == AuthMode.FirstPage ? 0.65 : 0.35,
              builder: (_, controller) {
                return Material(
                  elevation: 10,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: ListView(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Icon(
                                  Icons.radio_button_checked,
                                  color: kPrimaryColor,
                                ),
                                Dash(
                                    direction: Axis.vertical,
                                    length: 50,
                                    dashLength: 5,
                                    dashThickness: 3.0,
                                    dashColor: Colors.grey[400]),
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Départ".toUpperCase(),
                                      style: TextStyle(color: kSecondaryColor),
                                    ),
                                    Text("Current Location",
                                        style: textSubStyle),
                                  ],
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: new Center(
                                    child: new Container(
                                      margin: new EdgeInsetsDirectional.only(
                                          start: 1.0, end: 1.0),
                                      height: 1.0,
                                      color: kPrimaryColor,
                                      width: MediaQuery.of(context).size.width *
                                          .6,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Destination".toUpperCase(),
                                      style: TextStyle(color: kSecondaryColor),
                                    ),
                                    Text(
                                      "${widget.userPosition}",
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: textSubStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        if (_authMode == AuthMode.FirstPage)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Sélectionnez votre type de vehicule",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: choise.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (_selectedIndex == index) {
                                              _selectedIndex = -1;
                                            } else {
                                              _selectedIndex = index;
                                            }
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 110,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: index == _selectedIndex
                                                    ? kPrimaryColor
                                                    : kfirstColor,
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 90,
                                                    height: 70,
                                                    decoration:
                                                        new BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      image:
                                                          new DecorationImage(
                                                        image: new NetworkImage(
                                                          choise[index]
                                                              .imageUrl,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    choise[index].type,
                                                    style: TextStyle(
                                                        color: index ==
                                                                _selectedIndex
                                                            ? kfirstColor
                                                            : kPrimaryColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    choise[index].transport,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              child: index == _selectedIndex
                                                  ? InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedIndex =
                                                              index;
                                                        });
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaidScreen(
                                                          userposition: widget.userPosition,
                                                          indexe: index == _selectedIndex
                                                    ? kPrimaryColor : Colors.grey,
                                                        )));
                                                        print(
                                                            "==== USER PRESS $index");
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Mobile Money",
                                                            style: textSubStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            // Container(
                                            //   height: 80,
                                            //   child: _selectedIndex == index
                                            //       ? ListView.builder(
                                            //          scrollDirection: Axis.horizontal,
                                            //          shrinkWrap: true,
                                            //           itemCount: 4,
                                            //           itemBuilder: (cxt, i) {
                                            //           return Container(
                                            //             width: 50,
                                            //             height: 50,
                                            //             color: Colors.amber,
                                            //           );
                                            //         })
                                            //       : null,
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Container(
                                    width: 300,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _switchAuthMode();
                                      },
                                      child: Text('COMMANDER'),
                                      style: ElevatedButton.styleFrom(
                                          primary: kPrimaryColor,
                                          shape: StadiumBorder()),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        else
                          Center(
                            child: Container(
                              width: 300,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  _switchAuthMode();
                                },
                                child: Text('Continuer'),
                                style: ElevatedButton.styleFrom(
                                    primary: kPrimaryColor,
                                    shape: StadiumBorder()),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget mapImage() {
    return Image.asset("images/Bitmap.png");
  }

  Widget showBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .4,
      minChildSize: .3,
      maxChildSize: .85,
      builder: (BuildContext context, ScrollController scrollController) {
        final visity = Provider.of<InfoCarProvider>(context).items;

        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.radio_button_checked,
                              color: kPrimaryColor,
                            ),
                            Dash(
                                direction: Axis.vertical,
                                length: 50,
                                dashLength: 5,
                                dashThickness: 3.0,
                                dashColor: Colors.grey[400]),
                            Icon(
                              Icons.location_on,
                              color: Colors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Départ".toUpperCase(),
                                  style: TextStyle(color: kSecondaryColor),
                                ),
                                Text("Current Location", style: textSubStyle),
                              ],
                            ),
                            SizedBox(
                              height: 50.0,
                              child: new Center(
                                child: new Container(
                                  margin: new EdgeInsetsDirectional.only(
                                      start: 1.0, end: 1.0),
                                  height: 1.0,
                                  color: kPrimaryColor,
                                  width: MediaQuery.of(context).size.width * .6,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Destination".toUpperCase(),
                                  style: TextStyle(color: kSecondaryColor),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "",
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: textSubStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                // width: MediaQuery.of(context).size.width * .6,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Continuer',
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
            ],
          ),
        );
      },
    );
  }
}
