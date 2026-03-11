// ignore_for_file: file_names, non_constant_identifier_names

class CampotModel {
  String c_name;
  String image;
  String description;
  List<String> yourOpinionLevel;
  double price;

  CampotModel({
    required this.c_name,
    required this.image,
    required this.description,
    required this.yourOpinionLevel,
    required this.price,
  });

  static List<CampotModel> getMainListJuices() {
    List<CampotModel> mainListJuices = [];
    mainListJuices = [
      CampotModel(
        c_name: 'Norm campot',
        image: 'assets/images/', // fotka
        description: 'Homemade juice made from fresh organic fruits with natural sweetness and rich flavor',
        yourOpinionLevel: ['домашний', 'натуральный', 'сладкий'],
        price: 2.7,
      ),
      CampotModel(
        c_name: 'Strawberry campot',
        image: 'assets/images/', //fotka
        description: 'Sweet and refreshing strawberry juice packed with natural vitamins and antioxidants',
        yourOpinionLevel: ['сладкий', 'ягодный', 'освежающий'],
        price: 1.5,
      ),
      CampotModel(
        c_name: 'Lemon campot',
        image: 'assets/images/', // fotka
        description: 'Tangy and invigorating lemon juice with bright citrus notes and natural freshness',
        yourOpinionLevel: ['кислый', 'цитрусовый', 'освежающий'],
        price: 1.8,
      ),
      CampotModel(
        c_name: 'Orange and lime campot',
        image: 'assets/images/', // fotka
        description: 'Vibrant orange juice with tropical sweetness and energizing citrus flavor profile',
        yourOpinionLevel: ['сладкий', 'фруктовый', 'цитрусовый'],
        price: 1.3,
      ),
    ];
    return mainListJuices;
  }
}
