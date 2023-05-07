import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    Key? key,
    required this.title,
    required this.thumb,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //GestureDetector: 제스처를 확인해서 이벤트를 발생시킨다
      onTap: () {
        Navigator.push(
            //Navigator.push: 애니메이션 효과를 이용해서 유저가 다른 페이지로 왔다고 느끼게 해줄 수 있다
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              ),
            ));
      },
      child: Column(
        children: [
          // 에러의 원인

          // 따로 User-Agent 값을 추가하지 않으면 기본값으로 `Dart/<version> (dart:io)` 가 들어갑니다.
          // (https://api.flutter.dev/flutter/dart-io/HttpClient/userAgent.html)

          // 이 값을 지우고 브라우저에서 사용하는 값으로 바꿔줍니다.
          // (브라우저 값이 아니면 네이버에서 차단하는걸로 보입니다)
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              child: Image.network(
                thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
