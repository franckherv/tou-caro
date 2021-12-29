import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:tou_caro_app/screens/draggable_screen.dart';
import '../app_styles.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({Key key}) : super(key: key);

  @override
  _UserLocationScreenState createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  String _searchText = "";
  TextEditingController _searchController = TextEditingController();

  Future<void> _getCurrentLocation() async {
    final loc = await Location().getLocation();
    print(loc.latitude);
    print(loc.longitude);
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: ListView(
                  children: [
                    Image.asset("images/Bitmap.png", fit: BoxFit.cover),
                  ],
                )),
            Expanded(
                child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Où allez vous ?",
                            style: textStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Commandez votre trajet maintenant!"),
                          SizedBox(
                            height: 12,
                          ),
                          TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              labelText: "Entrer votre destination",
                              hintText: "Destination",
                              suffixIcon: _searchText.isEmpty
                                  ? null
                                  : IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {
                                        print(_searchText);
                                        _sendDataToSecondScreen(context);
                                       
                                        setState(() {
                                          _searchText = _searchController.text;
                                        });
                                        setState(() {
                                          _searchController.clear();
                                        });
                                      },
                                    ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

   void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = _searchController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DraggableScreen(userLocation: textToSend,),
        ));
  }
  
}
