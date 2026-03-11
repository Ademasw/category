import 'package:flutter/material.dart';

class AsianFoodModel {
  final String id;
  final String name;
  final String description;
  final double price; // Changed to double but will be used as Som
  final String imagePath;
  final Color themeColor;
  final double rating;
  final int calories;
  final String preparationTime;

  AsianFoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.themeColor,
    required this.rating,
    required this.calories,
    required this.preparationTime,
  });

  static List<AsianFoodModel> getSushi() {
    return [
      AsianFoodModel(
        id: 's1',
        name: 'Дракон Ролл',
        description: 'Угорь, огурец и крабовое мясо, украшенные авокадо и сладким соусом унаги.',
        price: 450.0,
        imagePath: 'assets/images/sushi_1.png',
        themeColor: const Color(0xFFD32F2F),
        rating: 4.8,
        calories: 320,
        preparationTime: '15 мин',
      ),
      AsianFoodModel(
        id: 's2',
        name: 'Острый Ролл с Тунцом',
        description: 'Свежий тунец, смешанный со спайси майонезом, с огурцом и кунжутом.',
        price: 380.0,
        imagePath: 'assets/images/sushi_2.png',
        themeColor: const Color(0xFFE57373),
        rating: 4.6,
        calories: 290,
        preparationTime: '12 мин',
      ),
      AsianFoodModel(
        id: 's3',
        name: 'Нигири с Лососем',
        description: 'Классический ломтик сырого лосося на прессованном рисе.',
        price: 250.0,
        imagePath: 'assets/images/sushi_3.png',
        themeColor: const Color(0xFFFF8A65),
        rating: 4.7,
        calories: 210,
        preparationTime: '10 мин',
      ),
      AsianFoodModel(
        id: 's4',
        name: 'Филадельфия Классик',
        description: 'Свежий лосось, сливочный сыр и огурец.',
        price: 400.0,
        imagePath: 'assets/images/sushi_4.png',
        themeColor: const Color(0xFFFF8A65),
        rating: 4.8,
        calories: 310,
        preparationTime: '15 мин',
      ),
      AsianFoodModel(
        id: 's5',
        name: 'Калифорния',
        description: 'Крабовое мясо, авокадо, огурец и икра тобико.',
        price: 350.0,
        imagePath: 'assets/images/sushi_5.png',
        themeColor: const Color(0xFFFF9800),
        rating: 4.7,
        calories: 280,
        preparationTime: '12 мин',
      ),
    ];
  }

  static List<AsianFoodModel> getRamen() {
    return [
      AsianFoodModel(
        id: 'r1',
        name: 'Острый Мисо Рамен',
        description: 'Наваристый свиной бульон с острой пастой мисо, чашу, яйцом и зеленым луком.',
        price: 550.0,
        imagePath: 'assets/images/ramen_1.png',
        themeColor: const Color(0xFFFBC02D),
        rating: 4.9,
        calories: 650,
        preparationTime: '20 мин',
      ),
      AsianFoodModel(
        id: 'r2',
        name: 'Тонкоцу Рамен',
        description: 'Сливочный бульон на свиных костях, который варится 12 часов, подается с тонкой лапшой.',
        price: 480.0,
        imagePath: 'assets/images/ramen_2.png',
        themeColor: const Color(0xFFFFB74D),
        rating: 4.8,
        calories: 700,
        preparationTime: '25 мин',
      ),
      AsianFoodModel(
        id: 'r3',
        name: 'Сёю Рамен',
        description: 'Рамен на основе прозрачного бульона с соевым соусом, чашу и нори.',
        price: 450.0,
        imagePath: 'assets/images/ramen_3.png',
        themeColor: const Color(0xFF8D6E63),
        rating: 4.7,
        calories: 600,
        preparationTime: '20 мин',
      ),
      AsianFoodModel(
        id: 'r4',
        name: 'Сёфуку Рамен (с морепродуктами)',
        description: 'Креветки, кальмары и навар на рыбном бульоне.',
        price: 600.0,
        imagePath: 'assets/images/ramen_4.png',
        themeColor: const Color(0xFFE57373),
        rating: 4.9,
        calories: 550,
        preparationTime: '25 мин',
      ),
    ];
  }

  static List<AsianFoodModel> getDrinks() {
    return [
      AsianFoodModel(
        id: 'd1',
        name: 'Матча Боба Чай',
        description: 'Освежающий зеленый чай матча со льдом и жевательными шариками тапиоки.',
        price: 200.0,
        imagePath: 'assets/images/drink_1.png',
        themeColor: const Color(0xFF81C784),
        rating: 4.5,
        calories: 250,
        preparationTime: '5 мин',
      ),
      AsianFoodModel(
        id: 'd2',
        name: 'Тайский Чай',
        description: 'Сладкий и кремовый традиционный тайский чай со сгущенным молоком.',
        price: 180.0,
        imagePath: 'assets/images/drink_2.png',
        themeColor: const Color(0xFFFFB74D),
        rating: 4.7,
        calories: 280,
        preparationTime: '5 мин',
      ),
      AsianFoodModel(
        id: 'd3',
        name: 'Лимонад Юдзу',
        description: 'Освежающий лимонад с японским цитрусом юдзу и мятой.',
        price: 250.0,
        imagePath: 'assets/images/drink_3.png',
        themeColor: const Color(0xFFFFF176),
        rating: 4.8,
        calories: 120,
        preparationTime: '5 мин',
      ),
      AsianFoodModel(
        id: 'd4',
        name: 'Холодный Жасминовый Чай',
        description: 'Зеленый чай с ароматом жасмина и кубиками льда.',
        price: 150.0,
        imagePath: 'assets/images/drink_4.png',
        themeColor: const Color(0xFFDCE775),
        rating: 4.6,
        calories: 80,
        preparationTime: '3 мин',
      ),
    ];
  }

  static List<AsianFoodModel> getDesserts() {
    return [
      AsianFoodModel(
        id: 'ds1',
        name: 'Моти с мороженым',
        description: 'Мягкое и тягучее сладкое рисовое тесто с начинкой из мороженого.',
        price: 220.0,
        imagePath: 'assets/images/dessert_1.png',
        themeColor: const Color(0xFFF48FB1),
        rating: 4.6,
        calories: 180,
        preparationTime: '3 мин',
      ),
      AsianFoodModel(
        id: 'ds2',
        name: 'Матча Тирамису',
        description: 'Нежный десерт с зеленым чаем матча и сыром маскарпоне.',
        price: 300.0,
        imagePath: 'assets/images/dessert_2.png',
        themeColor: const Color(0xFF81C784),
        rating: 4.8,
        calories: 320,
        preparationTime: '5 мин',
      ),
      AsianFoodModel(
        id: 'ds3',
        name: 'Тайяки',
        description: 'Свежеиспеченная японская вафля в форме рыбки с шоколадной и бобовой начинкой.',
        price: 180.0,
        imagePath: 'assets/images/dessert_3.png',
        themeColor: const Color(0xFFBCAAA4),
        rating: 4.7,
        calories: 250,
        preparationTime: '7 мин',
      ),
    ];
  }

  static List<AsianFoodModel> getAllItems() {
    return [
      ...getSushi(),
      ...getRamen(),
      ...getDrinks(),
      ...getDesserts()
    ];
  }
}
