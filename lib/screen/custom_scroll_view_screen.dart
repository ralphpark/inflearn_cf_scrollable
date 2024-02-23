import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inflearn_cf_scrollable_widget/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('CustomScrollViewScreen'),
            floating: true, // 스크롤 했을때 리스트 중간에서 appbar가 나타나게 할수 있음
            pinned: false, // 스크롤 했을때 리스트 상단에서 appbar가 나타나게 할수 있음
            snap: true, // 스크롤 했을때 리스트 상단에서 appbar가 나타나게 할수 있음
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://picsum.photos/250?image=9',
                fit: BoxFit.cover,
              ),
            ),
          ),
          renderChildBuilder(),
        ],
      ),
    );
  }

  //1
  // 기본 렌더링법
  SliverList renderChildDefault() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map((index) => renderContainer(
                  color: rainbowColors[index % rainbowColors.length],
                  index: index,
                ))
            .toList(),
      ),
    );
  }

  //2
  // SliverList.builder 사용하기
  // SliverList와 같은 기능을 하지만, 리스트의 아이템이 많을 때 효율적으로 사용할 수 있다.
  // 스크롤 하는데로 추가적으로 렌더링을 하기 때문에, 리스트의 아이템이 많을 때 효율적으로 사용할 수 있다.
  SliverList renderChildBuilder() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: numbers.length,
      ),
    );
  }

  //3
  // renderSliverGridbuilder 사용하기
  //Gridview.builder와 같은 기능을 하지만, 리스트의 아이템이 많을 때 효율적으로 사용할 수 있다.

  SliverGrid renderSliverGridbuilder() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
            height: 100,
          );
        },
        childCount: numbers.length,
      ),
    );
  }

  //4
  // renderSliverGridList 사용하기

  SliverGrid renderSliverGridList() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      delegate: SliverChildListDelegate(
        numbers
            .map((index) => renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
          height: 100,
        ))
            .toList(),
      ),
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
