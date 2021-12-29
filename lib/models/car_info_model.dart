import 'package:flutter/foundation.dart';

class CarInfo {
  final String id;
  final String imageUrl;
  final String type;
  final String transport;
  CarInfo({
    @required this.id,
    @required this.imageUrl,
    @required this.type,
    @required this.transport,
  });
}
