import 'package:flutter/material.dart';
import 'package:ashalet_plov_bomba/local_data/models/asian_food.dart';
import 'package:ashalet_plov_bomba/local_data/models/category.dart';
import 'package:ashalet_plov_bomba/local_data/app_state.dart';

import 'details.dart';
import 'cart.dart';
import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<CategoryModel> categoryData = CategoryModel.getCategories();

  List<AsianFoodModel> allItems = AsianFoodModel.getAllItems();
  List<AsianFoodModel> itemsToDisplay = [];

  int selectedCategoryIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _updateListOnCategory();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
        _performSearch();
      });
    });
    
    // Listen to AppState to update cart badge
    AppState().addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    AppState().removeListener(() {});
    super.dispose();
  }

  void _updateListOnCategory() {
    String currentType = categoryData[selectedCategoryIndex].type;
    List<AsianFoodModel> currentCategoryList = [];
    
    switch (currentType) {
      case 'sushi':
        currentCategoryList = AsianFoodModel.getSushi();
        break;
      case 'ramen':
        currentCategoryList = AsianFoodModel.getRamen();
        break;
      case 'drinks':
        currentCategoryList = AsianFoodModel.getDrinks();
        break;
      case 'desserts':
        currentCategoryList = AsianFoodModel.getDesserts();
        break;
      default:
        currentCategoryList = AsianFoodModel.getSushi();
        break;
    }
    itemsToDisplay = currentCategoryList;
  }

  void _performSearch() {
    if (_searchQuery.isEmpty) {
      _updateListOnCategory();
    } else {
      itemsToDisplay = allItems.where((item) {
        return item.name.toLowerCase().contains(_searchQuery.toLowerCase()) || 
               item.description.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD32F2F),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.shopping_cart, color: Colors.white),
            if (AppState().cartItems.isNotEmpty)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${AppState().cartItems.length}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(), 
            categories(), 
            foodsList()
          ],
        ),
      ),
    );
  }

  Container header() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF121212), // Dark Charcoal
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  '🏮 Азиатский Экспресс 🏮',
                  style: TextStyle(
                    fontSize: 22, 
                    color: Color(0xFFFFC107), // Gold
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/asian_avatar.png'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Icon(Icons.info_outline, color: Colors.white), // Info icon fallback
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Откройте для себя подлинный\nвкус Азии! 🥢',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: '🔍 Поиск Суши, Рамена...',
              hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white54),
              filled: true,
              fillColor: Colors.white12,
              prefixIcon: const Icon(Icons.search, color: Color(0xFFFFC107), size: 22),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white70, size: 20),
                      onPressed: () {
                        _searchController.clear();
                      })
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            "Категории",
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: Color(0xFF121212)
            ),
          ),
        ),
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in categoryData) {
                    item.isSelected = false;
                  }
                  categoryData[index].isSelected = true;
                  selectedCategoryIndex = index;
                  if (_searchQuery.isNotEmpty) {
                    _searchController.clear();
                  } else {
                    _updateListOnCategory();
                  }
                  setState(() {});
                },
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: categoryData[index].isSelected
                            ? const Color(0xFFD32F2F) // Deep Red
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            offset: const Offset(0, 4),
                            blurRadius: 10,
                          )
                        ],
                        border: Border.all(
                          color: categoryData[index].isSelected 
                              ? Colors.transparent 
                              : Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image(
                          image: AssetImage(categoryData[index].iconPath),
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.fastfood,
                            color: categoryData[index].isSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categoryData[index].name,
                      style: TextStyle(
                        fontWeight: categoryData[index].isSelected ? FontWeight.bold : FontWeight.w500,
                        color: categoryData[index].isSelected ? const Color(0xFFD32F2F) : Colors.grey.shade700,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: categoryData.length,
          ),
        )
      ],
    );
  }

  Widget foodsList() {
    if (itemsToDisplay.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Icon(Icons.sentiment_dissatisfied, size: 60, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                _searchQuery.isNotEmpty
                    ? 'По запросу "$_searchQuery" блюд не найдено'
                    : 'В этой категории нет блюд.',
                style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final item = itemsToDisplay[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(foodModel: item),
              ),
            );
          },
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 15,
                )
              ],
            ),
            child: Row(
              children: [
                // Image container
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: item.themeColor.withValues(alpha: 0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (c, e, s) => Icon(Icons.image, size: 50, color: item.themeColor),
                      ),
                    ),
                  ),
                ),
                // Details container
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.bold, 
                                color: Color(0xFF121212)
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.description,
                              style: TextStyle(
                                color: Colors.grey.shade600, 
                                fontSize: 11,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${item.price.toInt()} с',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 16, 
                                color: Color(0xFFD32F2F) // Deep Red
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: itemsToDisplay.length,
    );
  }
}
