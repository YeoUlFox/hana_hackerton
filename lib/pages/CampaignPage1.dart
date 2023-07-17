import 'package:flutter/material.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';
import 'package:provider/provider.dart';

class CampaignPage1 extends StatefulWidget {
  const CampaignPage1({Key? key}) : super(key: key);

  @override
  State<CampaignPage1> createState() => _CampaignPage1State();
}

class _CampaignPage1State extends State<CampaignPage1> {
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
                  '중고 도서 기부 캠페인',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 320,
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text('일련번호',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey,
                          ),),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: Image.asset('/campaign1.png',),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 60, 50, 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(100, 60),
                      backgroundColor: Color(0xff0CA678),
                    ),
                    onPressed: () {
                      _routeProvider.setIndex(11);
                    },
                    child: Text(
                      '기부 가능 여부 확인하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(100, 60),
                      backgroundColor: Color(0xffDD5F88),
                    ),
                    onPressed: () {
                      _routeProvider.setIndex(11);
                    },
                    child: Text(
                      '도서 등록하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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

