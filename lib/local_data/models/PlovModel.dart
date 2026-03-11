// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PlovModel {
  String name;
  String image;
  Color colorBox;
  List<String> yourOpinionLevel;
  String description;
  double price;

  PlovModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.yourOpinionLevel,
    required this.description,
    required this.price,
  });
  static List<PlovModel> getMainListPlovs() {
    List<PlovModel> mainListPlovs = [];
    mainListPlovs = [
      PlovModel(
        name: 'Hoshan Plov',
        image: 'assets/images/ ', // fotka
        colorBox: const Color(0xffcff5cf),
        yourOpinionLevel: [
          'much  very carrots',
          'middle carrots',
          'super mix carrots'
        ],
        description:
            ' ашаламительный плов ашаламительный плов ашаламительный плов ашаламительный плов '
            ' лучший плов'
            ' не риса а патроны пулемета'
            ' вкусный плов вкусный плов вкусный плов вкусный плов вкусный плов вкусный плов',
        price: 5.5,
      ),
      PlovModel(
        name: 'Uzgen Plov',
        image: 'assets/images/', // fotka
        colorBox: const Color(0xffcff5cf),
        yourOpinionLevel: ['much  very carrot', 'middle carrot'],
        description:
            'Very delishious uzgen_plov Very delishious uzgen_plov '
            'Very delishious uzgen_plov Very delishious uzgen_plov '
            'Very delishious uzgen_plov Very delishious uzgen_plov ',
        price: 3.2,
      ),
      PlovModel(
        name: 'Combo Plov',
        image: 'assets/images/', // fotka
        colorBox: const Color(0xffcff5cf),
        yourOpinionLevel: ['much  very vegetables', 'middle vegetables'],
        description:
            'Combo Plov Combo Plov Combo Plov Combo Plov Combo Plov'
            'Combo Plov Combo Plov Combo Plov Combo Plov Combo Plov'
            'Combo Plov Combo Plov Combo Plov Combo Plov Combo Plov',
        price: 2.8,
      ),
      PlovModel(
        name: 'Unbeliveble Plov',
        image: 'assets/images/', // fotka
        colorBox: const Color(0xffcff5cf),
        yourOpinionLevel: [
          'much  very carrots',
          'middle carrots',
          'super mix carrots'
        ],
        description:
            'Pepe Watafa FA Pepe Watafa FA Pepe Watafa FA Pepe Watafa FA Pepe Watafa FA ',
        price: 2.5,
      ),
    ];
    return mainListPlovs;
  }
}
