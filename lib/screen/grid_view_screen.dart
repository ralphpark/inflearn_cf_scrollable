import 'package:flutter/material.dart';
import 'package:inflearn_cf_scrollable_widget/const/colors.dart';
import 'package:inflearn_cf_scrollable_widget/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  GridViewScreen({super.key});

  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'GridViewScreen',
      body:renderGridMaxBuilder(),
    );
  }

  //1
  // 기본 렌더링법
  // 한번에 다 그림
  Widget renderCountDefault() {
    return GridView.count(
        crossAxisCount: 2, // 2개의 열
        crossAxisSpacing: 10, // 열 간격
        mainAxisSpacing: 10, // 행 간격
        children: numbers
            .map((index) => renderContainer(
                  color: rainbowColors[index % rainbowColors.length],
                  index: index,
                ))
            .toList());
  }
  //2
  // GridView.builder 사용하기
  // GridView와 같은 기능을 하지만, 리스트의 아이템이 많을 때 효율적으로 사용할 수 있다.
  // 그리는것만 보임
  Widget renderGridBuilder() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }
  //3
  // GridView.builder 사용하기
  // SliverGridDelegateWithMaxCrossAxisExtent를 사용하면, 그리드의 최대 크기를 지정할 수 있다.
  Widget renderGridMaxBuilder() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100, // 최대가 100이면서 동일한 사이즈의 그리드를 생성
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
      itemCount: numbers.length,
    );
  }
  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print('renderContainer $index');
    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
