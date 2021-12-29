import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:provider/provider.dart';
import 'package:tou_caro_app/providers/destination_provider.dart';
import 'package:tou_caro_app/screens/choose_car_screen.dart';

import '../app_styles.dart';

class DraggableScreen extends StatefulWidget {
  final String userLocation;
  DraggableScreen({@required this.userLocation});

  @override
  _DraggableScreenState createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  bool _isLoading = false;

  void _showLoadingIndicator() {
    print('true');
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 5000), () {
      if (mounted)
        setState(() {
          _isLoading = false;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  ChooseCarScreen(userPosition: widget.userLocation)));
        });
      print(_isLoading);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            // fit: StackFit.loose,
            // clipBehavior: Clip.hardEdge,
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
              bottomDetailsSheet(),
            ],
          ),
        ),
      ),
    );
  }

  Widget mapImage() {
    return Image.asset("images/Bitmap.png");
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .6,
      minChildSize: .4,
      maxChildSize: .85,
      builder: (BuildContext context, ScrollController scrollController) {
        final visity = Provider.of<Destinations>(context).items;

        return Material(
          elevation: 10,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Column(
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 00),
                child: Column(
                  children: [
                    _isLoading
                        ? Column(
                            children: [
                              const CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "nous traitons votre réservation..."
                                      .toUpperCase(),
                                  style: textSubStyle),
                              SizedBox(
                                height: 7,
                              ),
                              Text("Votre trajet va bientôt commencer"),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kPrimaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Text("ANNULER"),
                                ),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: Column(
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
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Départ".toUpperCase(),
                                        style:
                                            TextStyle(color: kSecondaryColor),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Destination".toUpperCase(),
                                        style:
                                            TextStyle(color: kSecondaryColor),
                                      ),
                                      Text(
                                        "${widget.userLocation}",
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: textSubStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              Column(
                                //  mainAxisSize : MainAxisSize.min,
                                //  verticalDirection : VerticalDirection.down,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kfirstColor,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                  ],
                ),
              ),
              Expanded(
                  child: _isLoading
                      ? Container()
                      : Container(
                        //width: double.infinity,
                        alignment: Alignment.center,
                        //color: kPrimaryColor,
                        child: InkWell(
                          onTap: (){
                            _showLoadingIndicator();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            
                            width: 200,
                            height: 40,
                            child: Text('Continuer',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                  // : ElevatedButton(
                  //     onPressed: () {
                  //       _showLoadingIndicator();
                  //     },
                  //     child: Text('Continuer',
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold)),
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(32.0),
                  //       ),
                  //       primary: kPrimaryColor,
                  //       textStyle: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  ),
              Divider(
                color: kSecondaryColor,
                thickness: 10,
                //width: double.infinity,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Destination populaire".toUpperCase(),
                      style: TextStyle(color: kSecondaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: scrollController,
                  itemCount: visity.length,
                  itemBuilder: (cxt, i) => Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.location_on, color: kfirstColor),
                        title: Text(visity[i].city, style: textSubStyle),
                        trailing: Icon(Icons.star_border),
                      ),
                      Divider(),
                    ],
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
