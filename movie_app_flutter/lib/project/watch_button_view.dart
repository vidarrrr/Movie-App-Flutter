import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app_flutter/model/movie_model.dart';

import '../data/source/local/shared_prefs.dart';

class WatchButtonView extends StatefulWidget {
  const WatchButtonView({super.key, required this.movieModel});

  final MovieModel movieModel;
  @override
  State<WatchButtonView> createState() => _WatchButtonViewState();
}

class _WatchButtonViewState extends State<WatchButtonView> {
  bool _isAddedWatchList = false;

  @override
  void initState() {
    super.initState();
    if (widget.movieModel.title != null) {
      _isAddedWatchList = SharedPrefHelper.getBoolean(widget.movieModel.title!);
    }
  }

  void _toggleAddedWatchList(String title) {
    const added = "Added to watch";
    const removed = "Removed from watch";
    setState(() {
      _isAddedWatchList = !_isAddedWatchList;
      SharedPrefHelper.setBoolean(title, _isAddedWatchList);
      toastWatchList(_isAddedWatchList ? added : removed);
      if (_isAddedWatchList) {
        _addToWatchList(title);
      } else {
        _removeFromWatchList(title);
      }
    });
  }

  void _addToWatchList(String title) {
    int range = SharedPrefHelper.getMenuIndex();
    if (range < 0) range = 0;
    SharedPrefHelper.setString(
        "${SharedPrefHelper.menuItemSuffix}$range", title);
    SharedPrefHelper.setMenuIndex(++range);
  }

  Future<void> _removeFromWatchList(String title) async {
    int range = SharedPrefHelper.getMenuIndex();
    int currentIndex = SharedPrefHelper.getParamMenuName(title, range);
    await SharedPrefHelper.reorderMenu(currentIndex, range);
    SharedPrefHelper.setMenuIndex(--range);
  }

  void toastWatchList(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    const noTitle = "No title";
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.pink),
      child: IconButton(
          onPressed: () {
            _toggleAddedWatchList(widget.movieModel.title ?? noTitle);
          },
          icon: _isAddedWatchList
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
    );
  }
}
