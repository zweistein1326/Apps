import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/providers/orders.dart';
import 'package:rent_app/providers/products.dart';
import 'package:rent_app/screens/account_screen.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-screen';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void initState() {
    _pages = [
      {'page': SearchBar(), 'title': 'Shop'},
      {'page': CartBlock(), 'title': 'Cart'},
      {'page': AccountBlock(), 'title': 'Account'}
    ];
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) => {
            setState(() {
              _isLoading = false;
            })
          });
      Provider.of<Orders>(context).fetchAndSetUser().then((_) => {
            setState(() {
              _isLoading = false;
            })
          });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
      ),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _pages[_selectedPageIndex]['title'],
                    style: GoogleFonts.lato(),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color: Theme.of(context).primaryColor),
                    onPressed: () {
                      //open cart screen
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                ],
              ))),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _pages[_selectedPageIndex]['page'],
    );
  }
}
