import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final String bookPath;
  final String price;

  const Book({super.key, required this.bookPath, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            makeImage(BoxFit.fitWidth),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(
                price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }

  Widget makeImage(BoxFit option) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 1),
      child: Image.asset(bookPath, width: 80, height: 120, fit: option),
    );
  }
}
