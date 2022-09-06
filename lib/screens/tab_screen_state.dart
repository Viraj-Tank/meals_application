import 'package:flutter/material.dart';
import 'package:meals_application/screens/categories_screen.dart';
import 'package:meals_application/screens/favorites_screen.dart';

class TabsScreenState extends StatefulWidget {
  const TabsScreenState({Key? key}) : super(key: key);

  @override
  State<TabsScreenState> createState() => _TabsScreenStateState();
}

class _TabsScreenStateState extends State<TabsScreenState> {

  final List<Map<String, Object>> screens = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorite'}
  ];

  int _selectedPageIndex = 0;

  void _selectIndex(int value) {
    if (!(_selectedPageIndex == value)) {
      setState(() {
        _selectedPageIndex = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screens[_selectedPageIndex]['title'] as String),),
      body: screens[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _selectIndex(value),
        elevation: 8,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: "Favorite"),
        ],
      ),
    );
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Meals"),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categories",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star_border),
    //             text: "Favorite",
    //           )
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
