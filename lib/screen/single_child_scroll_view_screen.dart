import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inflearn_cf_scrollable_widget/const/colors.dart';
import 'package:inflearn_cf_scrollable_widget/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  SingleChildScrollViewScreen({super.key});

  final List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderPerformance(),
    );
  }

  // 1
  // 기본 렌더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors
            .map((color) => renderContainer(color: color))
            .toList(),
      ),
    );
  }

  // 2
  // 화면을 넘어가지 않아도 스크롤 되게 하기
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        renderContainer(color: Colors.black),
      ]),
    );
  }

  // 3
  // 위젯이 잘리지 않게 하기
  Widget renderClipNone() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        renderContainer(color: Colors.black),
      ]),
    );
  }

  // 4
  // 여러가지 physics 사용하기
  Widget renderPhysics() {
    return SingleChildScrollView(
      // physics: NeverScrollableScrollPhysics(), // 스크롤 안됨
      // physics: AlwaysScrollableScrollPhysics(), // 스크롤 가능
      // physics: BouncingScrollPhysics(), // ios 스타일
      // physics: ClampingScrollPhysics(), // android 스타일
      child: Column(
        children: rainbowColors
            .map((color) => renderContainer(color: color))
            .toList(),
      ),
    );
  }

  // 5
  // SingleChildScrollView 퍼포먼스
  Widget renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (number) => renderContainer(
            color: rainbowColors[number % rainbowColors.length],
            index: number,
          ),
        )
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if(index != null) print(index);
    return Container(
      height: 300,
      color: color,
    );
  }
}
