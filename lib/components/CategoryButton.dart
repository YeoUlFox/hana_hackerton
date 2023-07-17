import 'package:flutter/material.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatelessWidget {
  final String name;

  const CategoryButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final routeProvider = Provider.of<RouteProvider>(context);

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            // go to purchase
            routeProvider.setIndex(1);
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Image.asset(
              'assets/category/$name.png',
              fit: BoxFit.scaleDown,
              scale: 0.8,
            ),
          ),
        ),

        // 버튼 이름
        Container(
          margin: const EdgeInsets.only(top: 12.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
