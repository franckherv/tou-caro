
import 'package:flutter/material.dart';

class OnBoarding {
  final String title;
  final String subTitle;

  OnBoarding({
    @required this.title,
    @required this.subTitle,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Commander un trajet',
    subTitle: 'Il est maintenant possible se se faire conduire en toute sécuté par un conducteur à proximité',
  ),
  OnBoarding(
    title: 'Choisir un véhicule',
    subTitle: 'il est maintenant possible de choisir son type de véhicule selon ses bésoins',
  ),
  OnBoarding(
    title: 'Suivre son trajet',
    subTitle: 'Il est maintenant possible de visualiser l\'emplacement du véhicule en temps réel sur la carte',
  ),
  OnBoarding(
    title: 'Partager son trajet',
    subTitle: 'Il est maintenant possible de partager les détails de son trajet avec les amis pour des questions de sécurité',
  ),
];