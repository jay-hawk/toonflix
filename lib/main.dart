import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  //이 위젯의 key를 stateless widget이라는 슈퍼클래스에 보낸다
  // 위젯은 key라는 값을 가지고 있고, ID처럼 쓰인다

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
