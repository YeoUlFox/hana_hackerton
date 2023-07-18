import 'package:flutter/material.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';
import 'package:provider/provider.dart';
import 'package:hana_hackerton/components/Book.dart';
import 'package:hana_hackerton/components/CategoryButton.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late RouteProvider _routeProvider;

  @override
  Widget build(BuildContext context) {
    _routeProvider = Provider.of<RouteProvider>(context);

    Widget sellingBooks;

    if(_routeProvider.sellingStep == 0) {
      sellingBooks = Row(
          children: [
            Book(
                bookPath: "/books/book3.png", price: "21,000원"),
            Book(
                bookPath: "/books/book2.png", price: "21,000원"),
          ],);
    } else if(_routeProvider.sellingStep == 1) {
      sellingBooks = Center(
        child: Text('판매 중인 도서가 없습니다'),
      );
    } else {
      sellingBooks = Row(
        children: [
          Book(bookPath: "/books/book4.png", price: "4,000원"),
        ],
      );
    }

    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // 로고 이미지
          Center(
            child: Image.asset(
              "/logo.png",
              fit: BoxFit.cover,
            ), // TODO : 크기 조정 (?)
          ),

          // 포인트 및 아이디 표시 헤더
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
            child: Row(
              children: [
                const Text("추호성님",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Expanded(child: Text("")),
                Chip(
                  backgroundColor: const Color(0x22C3FAE8),
                  label: Text('${_routeProvider.userPoint.toString()} P',
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          // 캠페인 그림
          GestureDetector(
            onTap: () {
              _routeProvider.setIndex(10);
            },
            child: Image.asset("/donation_campaign.png"),
          ),

          // 판매 중인 책
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 12),
            width: double.infinity,
            child: const Text(
              "판매 중인 컨텐츠",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF419290)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            height: 200,
            width: double.infinity,
            child: Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: sellingBooks,
              )
            ),
          ),

          // 카테고리 버튼들
          const Column(
            children: [
              Row(
                children: [
                  CategoryButton(name: '철학'),
                  CategoryButton(name: '종교'),
                  CategoryButton(name: '사회'),
                  CategoryButton(name: '기술')
                ],
              ),
              Row(
                children: [
                  CategoryButton(name: '예술'),
                  CategoryButton(name: '언어'),
                  CategoryButton(name: '문학'),
                  CategoryButton(name: '사회')
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
