import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/images_path.dart';

import '../common/text_style.dart';

class TabView extends StatefulWidget {
  const TabView(
      {super.key,
      required this.title,
      required this.index,
      required this.onClick,
      required this.isSelected});

  final int index;
  final bool isSelected;
  final Function(int currentIndex) onClick;
  final String title;
  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick(widget.index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyleBold().getBoldStyle(20),
          ),
          const SizedBox(
            height: 10,
          ),
          if (widget.isSelected)
            Image(
              image: AssetImage(ImagesPath.rectangleTab.getPath()),
            )
        ],
      ),
    );
  }
}
