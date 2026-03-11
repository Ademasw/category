class CategoryModel {
  String name;
  String iconPath;
  String type;
  bool isSelected;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.type,
    this.isSelected = false,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        name: 'Суши',
        iconPath: 'assets/images/category_sushi.png',
        type: 'sushi',
        isSelected: true,
      ),
      CategoryModel(
        name: 'Рамен',
        iconPath: 'assets/images/category_ramen.png',
        type: 'ramen',
      ),
      CategoryModel(
        name: 'Напитки',
        iconPath: 'assets/images/category_drinks.png',
        type: 'drinks',
      ),
      CategoryModel(
        name: 'Десерты',
        iconPath: 'assets/images/category_desserts.png',
        type: 'desserts',
      ),
    ];
  }
}
