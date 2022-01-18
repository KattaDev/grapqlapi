import 'package:diamonds/core/graphqlclients.dart';
import 'package:diamonds/pages/chat/moneychat.dart';
import 'package:diamonds/pages/login/login_page.dart';
import 'package:diamonds/product.dart/products.dart';
import 'package:diamonds/pages/orders/oder_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    ProductsPage(),
    const OrderPage(),
    ChatPageMoney(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Товар',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Заказ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Чат',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  
}
