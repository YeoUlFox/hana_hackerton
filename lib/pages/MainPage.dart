import 'package:flutter/material.dart';
import 'package:hana_hackerton/components/Book.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoading = false;

  void loadingBooks() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              "/logo.png",
              fit: BoxFit.cover,
            ), // TODO : 크기 조정 (?)
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
            child: const Row(
              children: [
                Text("별돌이",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Expanded(child: Text("")),
                Chip(
                  backgroundColor: Color(0x22C3FAE8),
                  label: Text('400 P',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          // 캠페인 그림
          Image.asset("/donation_campaign.png"),

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
                  child: isLoading
                      ? const Row(
                          children: [
                            Book(
                                bookPath: "/books/book1.png", price: "30,000원"),
                            Book(
                                bookPath: "/books/book2.png", price: "30,000원"),
                            Book(bookPath: "/books/book3.png", price: "30,000원")
                          ],
                        )
                      : const Row(
                          children: [
                            Book(
                                bookPath: "/books/book1.png", price: "30,000원"),
                            Book(
                                bookPath: "/books/book2.png", price: "30,000원"),
                          ],
                        )),
            ),
          )
        ],
      ),
    ));
  }
}
