import 'package:flutter/material.dart';
import 'package:hana_hackerton/pages/HomePage.dart';

class PurchaseCompletePage extends StatefulWidget {
  const PurchaseCompletePage({Key? key}) : super(key: key);

  @override
  State<PurchaseCompletePage> createState() => _PurchaseCompletePageState();
}

class _PurchaseCompletePageState extends State<PurchaseCompletePage> {
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
              child: Center(
                child: Text(
                  '구매 완료',
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
                  padding: EdgeInsets.fromLTRB(0, 60, 0, 50),
                  child: Image.asset('/purchase.png'),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
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
