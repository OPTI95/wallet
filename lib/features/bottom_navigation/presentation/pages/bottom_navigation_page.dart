import 'package:flutter/material.dart';
import 'package:vkarmane/features/document/presentation/pages/document_page.dart';
import 'package:vkarmane/features/visit_card/presentation/pages/visit_card_page.dart';

import '../../../cards/presentation/pages/card_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    CardPage(),
    DocumentPage(),
    VisitCardPage()
  ];
  static const List<BottomNavigationBarItem> _icons = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("images/payment.png"),
          size: 20,
        ),
        label: "Карта"),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("images/docs.png"),
          size: 20,
        ),
        label: "Документ"),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("images/visit_card.png"),
          size: 20,
        ),
        label: "Визитка"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: _icons,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
