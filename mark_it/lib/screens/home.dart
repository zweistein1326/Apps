import 'package:flutter/material.dart';
import 'package:mark_it/screens/cart_screen.dart';
import 'package:mark_it/screens/user_screen.dart';
import 'package:mark_it/widgets/badge.dart';
import '../widgets/offers_location.dart';
import './home_screen.dart';
import './categories_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      {'page': UserScreen(), 'title': Text('User')}
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
            icon: Consumer<Cart>(
              builder: (_, cartData, ch) => cartData.itemCount != 0
                  ? Badge(
                      child: ch,
                      value: cartData.itemCount.toString(),
                    )
                  : ch,
              child: Container(
                child: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
            title: Text('Categories'),
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
