// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SaladModel {
  String name;
  String image;
  Color colorBox;
  List<String> yourOpinionLevel;
  String description;
  double price;

  SaladModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.yourOpinionLevel,
    required this.description,
    required this.price,
  });

  static List<SaladModel> getMainListSalads() {
    List<SaladModel> mainListSalads = [];

    mainListSalads.add(SaladModel(
      name: 'Greek Salad',
      image: 'assets/images/veget_bureger02.png',
      colorBox: const Color(0xffcff5cf),
      yourOpinionLevel: ['light feta', 'classic', 'extra olives'],
      description:
          'Fresh cucumbers, tomatoes, feta and olives with extra virgin olive oil.',
      price: 8.4,
    ));

    mainListSalads.add(SaladModel(
      name: 'Caesar Salad',
      image: 'assets/images/hot_pepper_burger.png',
      colorBox: const Color(0xffeadbfd),
      description:
          'Romaine lettuce, crunchy croutons, parmesan and creamy Caesar dressing.',
      yourOpinionLevel: ['classic', 'with chicken', 'extra parmesan'],
      price: 9.8,
    ));

    mainListSalads.add(SaladModel(
      name: 'Vitamin Mix Salad',
      image: 'assets/images/pomelo_juice.png',
      colorBox: const Color(0xfffccee5),
      yourOpinionLevel: ['no onion', 'classic', 'extra greens'],
      description:
          'Cabbage, carrots, bell pepper and herbs with lemon and olive dressing.',
      price: 7.3,
    ));

    mainListSalads.add(SaladModel(
      name: 'Beetroot Walnut Salad',
      image: 'assets/images/strawberry_juice.png',
      colorBox: const Color(0xfff7d5df),
      yourOpinionLevel: ['light garlic', 'classic', 'extra walnuts'],
      description:
          'Baked beetroot, walnuts and soft cheese with yogurt herb dressing.',
      price: 8.9,
    ));

    mainListSalads.add(SaladModel(
      name: 'Avocado Cucumber Salad',
      image: 'assets/images/orange_juice.png',
      colorBox: const Color(0xffd9f5f2),
      yourOpinionLevel: ['no chili', 'classic', 'extra avocado'],
      description:
          'Avocado, cucumber, greens and citrus dressing with a fresh finish.',
      price: 10.1,
    ));

    return mainListSalads;
  }
}
