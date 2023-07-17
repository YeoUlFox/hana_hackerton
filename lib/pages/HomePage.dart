import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hana_hackerton/pages/PurchaseCompletePage.dart';
import 'package:hana_hackerton/pages/PurchasePage.dart';
import 'package:hana_hackerton/pages/SearchPage.dart';
import 'package:hana_hackerton/pages/MainPage.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RouteProvider _routeProvider;

  final List<Widget> _pages = [
    SearchPage(),
    MainPage(),
    PurchasePage(),
    PurchaseCompletePage(),
  ];

  @override
  Widget build(BuildContext context) {
    _routeProvider = Provider.of<RouteProvider>(context);

    return Scaffold(
      body: _pages[Provider.of<RouteProvider>(context).currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<RouteProvider>(context).currentIndex >= _pages.length
            ? Provider.of<RouteProvider>(context).currentIndex
            : 1,
        selectedItemColor: const Color(0xff419290),
        // Change the icon color here
        onTap: (index) {
          _routeProvider.setIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
