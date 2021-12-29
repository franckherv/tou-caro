import 'package:flutter/foundation.dart';

class Destination with ChangeNotifier {
  final String id;
  final String city;
  bool isFavorite;
  Destination({
    @required this.id,
    @required this.city,
    this.isFavorite = false,
  });

  void toggleFovoris() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
