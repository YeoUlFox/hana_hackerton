import 'package:flutter/material.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';
import 'package:provider/provider.dart';

class BookShelfPage1 extends StatefulWidget {
  const BookShelfPage1({Key? key}) : super(key: key);

  @override
  State<BookShelfPage1> createState() => _BookShelfPage1State();
}

class _BookShelfPage1State extends State<BookShelfPage1> {
  late RouteProvider _routeProvider;

  @override
  Widget build(BuildContext context) {
    _routeProvider = Provider.of<RouteProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF9F9FB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            flexibleSpace: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '내 서재',
                  style: TextStyle(
                    color: Color(0xff419290),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Container(
                        width: 195,
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff419290),
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          '구매',
                          style: TextStyle(
                              color: Color(0xff39393A),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _routeProvider.setIndex(7);
                        },
                        child: Container(
                          width: 195,
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffE7E7E7),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            '판매',
                            style: TextStyle(
                              color: Color(0xff8C8C8C),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 60),
                  child: Image.asset(
                    '/bookshelf1.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
