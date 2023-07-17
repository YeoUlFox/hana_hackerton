import 'dart:math';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9FB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 1.5), // Adjust the margin as per your requirements
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform search action
                        },
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '검색',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset('/books.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset('/books.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset('/books.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Image.asset('/books.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
