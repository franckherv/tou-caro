import 'package:flutter/foundation.dart';
import '../models/destination_model.dart';

class Destinations with ChangeNotifier {
  final List<Destination> _items = [
    Destination(id: "1", city: "Cosmos Yopougon"),
    Destination(id: "2", city: "Pharmacie Keneya"),
    Destination(id: "3", city: "Yopougon figayo"),
    Destination(id: "4", city: "Yopougon Saint André"),
    Destination(id: "1", city: "Pharmacie du marché"),
    Destination(id: "1", city: "Yopougon Bel Air"),
  ];

  List<Destination> get items {
    return [..._items]; 
}


   Destination findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }
}
