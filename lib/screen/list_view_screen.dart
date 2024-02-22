import 'package:flutter/material.dart';
import 'package:inflearn_cf_scrollable_widget/const/colors.dart';
import 'package:inflearn_cf_scrollable_widget/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ListViewScreen',
        body: renderSeparated(),
    );
  }

  // 1
  // 기본 렌더링법
  Widget renderDefault() {
    return ListView(
      children: numbers
          .map((index) => renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index))
          .toList(),
    );
  }

  //2
  // ListView.builder 사용하기
  // ListView와 같은 기능을 하지만, 리스트의 아이템이 많을 때 효율적으로 사용할 수 있다.
  // 스크롤 하는데로 추가적으로 렌더링을 하기 때문에, 리스트의 아이템이 많을 때 효율적으로 사용할 수 있다.
  Widget renderBuilder() {
    return ListView.builder(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  // 3
  // ListView.separated 사용하기
  // ListView.builder와 같은 기능을 하지만, 리스트의 아이템 사이에 구분선을 추가할 수 있다.
  Widget renderSeparated() {
    return ListView.separated(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        // 5개의 item마다 배너 보여주기
        index++;
        if (index % 5 == 0) {
          return Container(
            height: 100,
            color: Colors.blue,
            child: Center(
              child: Text(
                '광고',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }
        return renderContainer(
          color: Colors.black,
          index: index,
          height: 100,
        );
      },
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
