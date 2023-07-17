import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';

class CampaignPage2 extends StatefulWidget {
  const CampaignPage2({Key? key}) : super(key: key);

  @override
  State<CampaignPage2> createState() => _CampaignPage2State();
}

class _CampaignPage2State extends State<CampaignPage2> {
  late RouteProvider _routeProvider;

  @override
  Widget build(BuildContext context) {
    _routeProvider = Provider.of<RouteProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff6CB9DA),
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
                  padding: EdgeInsets.fromLTRB(30, 100, 30, 40),
                  child: Image.asset('/campaign.png',),
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
                      _routeProvider.setIndex(2);
                    },
                    child: Text(
                      '메인 페이지',
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

