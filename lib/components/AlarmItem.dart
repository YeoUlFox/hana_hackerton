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
                    child: widget.isSelling
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: DefaultTextStyle.of(context)
                                  .style, // 기본 텍스트 스타일
                              children: <TextSpan>[
                                const TextSpan(
                                  text: '반납 하신 ',
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
                                  text: '\n책이 판매되었어요!',
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
                    } else {
                      setState(() {
                        isVisiable = false;
                      });
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
}
