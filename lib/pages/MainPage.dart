import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Image.asset("/logo.png", fit: BoxFit.cover,), // TODO : 크기 조정 (?)
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("별돌이", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      label: Text('Aaron Burr'),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    ));
  }
}
