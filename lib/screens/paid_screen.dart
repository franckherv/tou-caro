import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:provider/provider.dart';
import 'package:tou_caro_app/providers/car_info_provider.dart';

import '../app_styles.dart';

class PaidScreen extends StatefulWidget {
  final String userposition;
  final Color indexe;
  const PaidScreen({@required this.userposition, @required this.indexe});

  @override
  _PaidScreenState createState() => _PaidScreenState();
}

class _PaidScreenState extends State<PaidScreen> {
  @override
  Widget build(BuildContext context) {
    final choise = Provider.of<InfoCarProvider>(context).items;

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
              maxChildSize: 0.9,
              minChildSize: 0.3,
              initialChildSize: 0.8,
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
                                      "${widget.userposition}",
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Type de véhicule sélectionné",
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
                                    MediaQuery.of(context).size.height * 0.18,
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
                                        setState(() {});
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 110,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: widget.indexe,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 90,
                                                  height: 70,
                                                  decoration: new BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    image: new DecorationImage(
                                                      image: new NetworkImage(
                                                        choise[index].imageUrl,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  choise[index].type,
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Choisir votre type de paiement",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  height: 120,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: [
                                      _modePaid(kPrimaryColor, "ESPECES",
                                          kfirstColor),
                                      _modePaid(
                                          Colors.blue, "WAVE", Colors.white),
                                      _modePaid(Colors.deepOrange,
                                          "ORANGE MONNEY", kfirstColor),
                                      _modePaid(Colors.amber, "MTN MONNEY",
                                          Colors.indigo),
                                      _modePaid(Colors.green[400],
                                          "MOOV MONNEY", Colors.red),
                                    ],
                                  )),
                              Container(
                                height: 50,
                              ),
                              Center(
                                child: Container(
                                  width: 300,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('COMMANDER'),
                                    style: ElevatedButton.styleFrom(
                                        primary: kPrimaryColor,
                                        shape: StadiumBorder()),
                                  ),
                                ),
                              )
                            ],
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

  Widget _modePaid(Color containerColor, String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print(text);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          width: 100,
          height: 120,
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(8)),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
