import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hana_hackerton/provider/RouteProvider.dart';

class AlarmItem extends StatefulWidget {
  final String bookname;
  final bool isSelling; // true :

  const AlarmItem({super.key, required this.bookname, required this.isSelling});

  @override
  State<StatefulWidget> createState() => _AlarmItemState();
}

class _AlarmItemState extends State<AlarmItem> {
  bool isVisiable = true;

  @override
  Widget build(BuildContext context) {
    return isVisiable
        ? Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5), // 그림자의 색상
                    offset: const Offset(4, 4), // 그림자의 위치 (오른쪽 아래로 4만큼 이동)
                    blurRadius: 2, // 그림자의 흐림 정도
                  ),
                ]),
            height: 80,
            child: Row(
              children: [
                const Image(
                  image: AssetImage("alarm/alarm_byul.png"),
                  fit: BoxFit.fitHeight,
                ),
                Expanded(
                    child: !widget.isSelling
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: DefaultTextStyle.of(context)
                                  .style, // 기본 텍스트 스타일
                              children: <TextSpan>[
                                const TextSpan(
                                  text: '구매 하신 ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.bookname,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent, // 원하는 색상 지정
                                  ),
                                ),
                                const TextSpan(
                                  text: '\n책이 도착했어요!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: DefaultTextStyle.of(context)
                                  .style, // 기본 텍스트 스타일
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.bookname,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent, // 원하는 색상 지정
                                  ),
                                ),
                                const TextSpan(
                                  text: '가 도착했어요!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )),
                GestureDetector(
                  onTap: () {
                    if (widget.isSelling) {
                      setState(() {
                        isVisiable = false;
                      });
                      _showGetSellingDialog(context, widget.bookname, 21000, 3000);
                    } else {
                      setState(() {
                        isVisiable = false;
                      });
                      _showBookGetDialog(context, widget.bookname, 1200);
                    }
                  },
                  child: const Image(
                    image: AssetImage("alarm/down_point.png"),
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ))
        : const SizedBox();
  }

  _showBookGetDialog(BuildContext context, String bookname, int point) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Image.asset("alarm/book_get.png"),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style, // 기본 텍스트 스타일
                    children: <TextSpan>[
                      TextSpan(
                        text: bookname,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent, // 원하는 색상 지정
                        ),
                      ),
                      const TextSpan(
                        text: '이\n 내 콘텐츠에\n 추가되었어요!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: const Color(0xFF63E6BE)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showPromoteDialog(context, point);
                    },
                    child: const Text('알겠어요.', style: TextStyle(color: Colors.white)),
                  ),
                ))
          ],
        ));
      },
    );
  }

  _showPromoteDialog(BuildContext context, int point) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style, // 기본 텍스트 스타일
                    children: const <TextSpan>[
                      TextSpan(
                        text: "종이책 사용 절감으로\n 환경에 기여하신",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '호성님',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent, // 원하는 색상 지정
                        ),
                      ),
                      TextSpan(
                        text: "께\n 드리는 포인트에요!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // 포인트 텍스트
                Container(
                  margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text("${point}P", style: const TextStyle(fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold),)
                ),

                const Divider(
                  height: 20,
                  color: Colors.grey,
                ),
                
                // 승급 이미지
                Image.asset("alarm/promote.png"),

                // 알겠어요 버튼
                Container(
                    margin: const EdgeInsets.only(top: 18.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: const Color(0xFF63E6BE)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('알겠어요.', style: TextStyle(color: Colors.white)),
                      ),
                    ))
              ],
            ));
      },
    );
  }

  _showGetSellingDialog(BuildContext context, String bookname, int point, int recellPoint) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style, // 기본 텍스트 스타일
                    children: <TextSpan>[
                      TextSpan(
                        text: bookname,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      const TextSpan(
                        text: '\n판매로 얻은 포인트에요',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // 포인트 텍스트
                Container(
                    margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text("${point}P", style: const TextStyle(fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold),)
                ),

                const Divider(
                  height: 20,
                  color: Colors.grey,
                ),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style, // 기본 텍스트 스타일
                    children: <TextSpan>[
                      const TextSpan(
                        text: "이 거래로",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '${recellPoint}원',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent, // 원하는 색상 지정
                        ),
                      ),
                      const TextSpan(
                        text: "의 금액이\n 저작권자에게 돌아갔어요!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // 승급 이미지
                // Image.asset("alarm/promote.png"),

                // 알겠어요 버튼
                Container(
                    margin: const EdgeInsets.only(top: 18.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: const Color(0xFF63E6BE)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('알겠어요.', style: TextStyle(color: Colors.white)),
                      ),
                    ))
              ],
            ));
      },
    );
  }
}
