import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/text_style.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key, required this.watchList});

  final List<String> watchList;
  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final text = "WATCH LIST";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xffBB86FC)),
            child: Center(
              child: Text(
                text,
                style: TextStyleBold()
                    .getBoldStyle(20)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          //https://stackoverflow.com/questions/52801075/add-listwidget-to-listview-children-dynamically
          ..._buildItems()
        ],
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> widgetList = [];
    for (String name in widget.watchList) {
      widgetList.add(ListTile(
        title: Text(name),
      ));
    }
    return widgetList;
  }
}
