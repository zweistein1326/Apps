import 'package:flutter/material.dart';
import '../widgets/shops_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import './cart_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      {'page': ShopsGrid(), 'title': Text('MarkIt')},
      // {'page': CategoriesScreen(), 'title': Text('Categories')},
      {'page': CartScreen(), 'title': Text('Cart')},
      // {'page': UserScreen(), 'title': Text('User')}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      drawer: AppDrawer(),
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
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('User'),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
