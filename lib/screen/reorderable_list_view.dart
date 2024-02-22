import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inflearn_cf_scrollable_widget/const/colors.dart';
import 'package:inflearn_cf_scrollable_widget/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({super.key});

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        //reorderable list view는 컨테이너 요소를 길게 눌러서 순서를 바꿀 수 있는 리스트뷰이다.
        title: 'ReorderableListViewScreen',
        body: renderReorderBuilderContainer()
    );
  }

  // 1
  // 기본 렌더링법
  Widget renderReorderDefault() {
    return ReorderableListView(
        children: numbers
            .map((index) => renderContainer(
                  color: rainbowColors[index % rainbowColors.length],
                  index: index,
                ))
            .toList(),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            // 1. oldIndex의 아이템을 newIndex로 옮긴다.
            // 2. oldIndex가 newIndex보다 작으면 newIndex를 1 감소시킨다.
            // 3. numbers에서 oldIndex의 아이템을 제거한다.
            // 4. numbers에서 newIndex에 oldIndex의 아이템을 추가한다.
            // oldIndex와 newIndex모두 이동이 되기 전에 산정한다.
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = numbers.removeAt(oldIndex);
            numbers.insert(newIndex, item);
          });
        });
  }

  Widget renderReorderBuilderContainer() {
    return ReorderableListView.builder(
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[numbers[index] % rainbowColors.length],
          index: numbers[index],
          height: 100,
        );
      },
      itemCount: numbers.length,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          // 1. oldIndex의 아이템을 newIndex로 옮긴다.
          // 2. oldIndex가 newIndex보다 작으면 newIndex를 1 감소시킨다.
          // 3. numbers에서 oldIndex의 아이템을 제거한다.
          // 4. numbers에서 newIndex에 oldIndex의 아이템을 추가한다.
          // oldIndex와 newIndex모두 이동이 되기 전에 산정한다.
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
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
      key: Key(index.toString()),
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
