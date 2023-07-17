import 'package:flutter/material.dart';
import 'package:hana_hackerton/components/AlarmItem.dart';
import 'package:hana_hackerton/pages/BookShelfPage1.dart';
import 'package:hana_hackerton/pages/BookShelfPage2.dart';
import 'package:hana_hackerton/pages/CampaignPage1.dart';
import 'package:hana_hackerton/pages/CampaignPage2.dart';
import 'package:hana_hackerton/pages/RegisterCompletePage.dart';
import 'package:hana_hackerton/pages/RegisterDetailPage.dart';
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

  @override
  Widget build(BuildContext context) {
    _routeProvider = Provider.of<RouteProvider>(context);

    const _pages = [
      BookShelfPage1(),
      SearchPage(),
      MainPage(),
      MainPage(),
      MainPage(),
      PurchasePage(),
      PurchaseCompletePage(),
      BookShelfPage2(),
      RegisterDetailPage(),
      RegisterCompletePage(),
      CampaignPage1(),
      CampaignPage2(),
    ];

    return Scaffold(
      body: Consumer<RouteProvider>(
        builder: (context, routeProvider, _) {
          return IndexedStack(
            index: routeProvider.currentIndex,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: Consumer<RouteProvider>(
        builder: (context, routeProvider, _) {
          return BottomNavigationBar(
            currentIndex: routeProvider.currentIndex >= _pages.length
                ? routeProvider.currentIndex
                : 2,
            onTap: (index) {
              routeProvider.setIndex(index);
              if (index == 3) _showAlarmsModal(context);
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.grey,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: '내 서재',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '검색',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active),
                label: '알람',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '마이 페이지',
              ),
            ],
          );
        },
      ),
    );
  }

  // 메인 알람 모달
  _showAlarmsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(
        minWidth: 340,
        minHeight: 100,
        maxHeight: 754,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(12.0),
          width: 360,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AlarmItem(bookname: "ICT 융합 기술", isSelling: false),
              AlarmItem(bookname: "과학 기술, 미래 국방과 만...", isSelling: false),
              AlarmItem(bookname: "그림으로 이해하는 네트워크", isSelling: false),
            ],
          ),
        );
      },
    );
  }
}
