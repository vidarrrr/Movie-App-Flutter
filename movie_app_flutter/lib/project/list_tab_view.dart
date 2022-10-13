import 'package:flutter/material.dart';
import 'package:movie_app_flutter/project/tab_view.dart';

class ListTabView extends StatefulWidget {
  const ListTabView(
      {super.key,
      required this.currentIndex,
      required this.changeCurrentTabIndex});

  final int currentIndex;
  final Function(int) changeCurrentTabIndex;
  @override
  State<ListTabView> createState() => _ListTabViewState();
}

class _ListTabViewState extends State<ListTabView> {
  final tabNames = [
    "In Theatre",
    "Box Office",
    "Coming Soon",
    "Coming Soon",
    "Coming Soon"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.09,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabNames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TabView(
                title: tabNames[index],
                index: index,
                isSelected: widget.currentIndex == index,
                onClick: (currentIndex) {
                  widget.changeCurrentTabIndex(currentIndex);
                },
              ),
            );
          }),
    );
  }
}
