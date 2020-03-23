import 'package:flutter/material.dart';
import 'package:mark_it/screens/cart_screen.dart';
import '../widgets/offers_location.dart';
import './home_screen.dart';
import './categories_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    print(_pages[_selectedPageIndex]['page']);
  }

  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': OffersLocation()},
      {'page': CategoriesScreen(), 'title': Text('Categories')},
      {'page': CartScreen(), 'title': Text('Cart')},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('User-Name'),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
