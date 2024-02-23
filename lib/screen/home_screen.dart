import 'package:flutter/material.dart';
import 'package:inflearn_cf_scrollable_widget/layout/main_layout.dart';
import 'package:inflearn_cf_scrollable_widget/screen/custom_scroll_view_screen.dart';
import 'package:inflearn_cf_scrollable_widget/screen/grid_view_screen.dart';
import 'package:inflearn_cf_scrollable_widget/screen/list_view_screen.dart';
import 'package:inflearn_cf_scrollable_widget/screen/reorderable_list_view.dart';
import 'package:inflearn_cf_scrollable_widget/screen/single_child_scroll_view_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({required this.builder, required this.name});
}

class HomeScreen extends StatelessWidget {
  final screen = [
    ScreenModel(
      builder: (context) => SingleChildScrollViewScreen(),
      name: 'SingleChildScrollViewScreen'
    ),
    ScreenModel(
      builder: (context) => ListViewScreen(),
      name: 'ListViewScreen'
    ),
    ScreenModel(
      builder: (context) => GridViewScreen(),
      name: 'GridViewScreen'
    ),
    ScreenModel(
      builder: (context) => ReorderableListViewScreen(),
      name: 'ReorderableListViewScreen'
    ),
    ScreenModel(
      builder: (context) => CustomScrollViewScreen(),
      name: 'CustomScrollViewScreen'
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: screen.map((e) => ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: e.builder));
              },
              child: Text(e.name),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
