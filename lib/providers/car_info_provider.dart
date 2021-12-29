import 'package:flutter/foundation.dart';
import '../models/car_info_model.dart';

class InfoCarProvider with ChangeNotifier {
  final List<CarInfo> _items = [
     CarInfo(
       id: "1", 
       imageUrl: "https://i.pinimg.com/564x/55/48/df/5548df6d51f9f8cf67801ebba60c582f.jpg",
       type: "Compacte", 
       transport: "2.000 F", 
    ),
    CarInfo(
       id: "2", 
       imageUrl: "https://i.pinimg.com/564x/e4/8a/4a/e48a4a2657171ab11f75d35d0fc9b086.jpg",
       type: "Interme", 
       transport: "5.000 F", 
    ),
     CarInfo(
       id: "3", 
       imageUrl: "https://i.pinimg.com/564x/76/85/92/76859291b22660bea0b432ebb0ed57d3.jpg",
       type: "Confort", 
       transport: "10.000 F", 
    ),
    CarInfo(
       id: "4", 
       imageUrl: "https://i.pinimg.com/564x/2e/d6/95/2ed6957f376bed76fe3e2993ce937272.jpg",
       type: "Luxieux", 
       transport: "15.000 F", 
    ),
  ];

  

  List<CarInfo> get items {
    return [..._items]; 
}
}
