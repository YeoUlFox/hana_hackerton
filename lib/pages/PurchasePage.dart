import 'package:flutter/material.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';
import 'package:provider/provider.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
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
                _routeProvider.setIndex(6);
              },
            ),
            flexibleSpace: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '구매 상세',
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Image.asset('/purchaseDetail.png'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(100, 60),
                      backgroundColor: Color(0xff0CA678),
                    ),
                    onPressed: () {
                      // go to purchase complete page
                      _routeProvider.setIndex(6);
                    },
                    child: Text(
                      '거래가 가능해요!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 100),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(100, 60),
                      backgroundColor: Color(0xffDD5F88),
                    ),
                    onPressed: () {
                      // go to purchase complete page
                      _routeProvider.setIndex(3);
                    },
                    child: Text(
                      '새책 구매하기',
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
