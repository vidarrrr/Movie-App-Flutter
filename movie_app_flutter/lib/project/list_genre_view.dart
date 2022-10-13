import 'package:flutter/material.dart';

class ListGenreView extends StatefulWidget {
  const ListGenreView(
      {super.key,
      required this.setMovieModel,
      required this.changeCurrentIndex,
      required this.currentIndex});

  final Function() setMovieModel;
  final Function(int) changeCurrentIndex;
  final int currentIndex;
  @override
  State<ListGenreView> createState() => _ListGenreViewState();
}

class _ListGenreViewState extends State<ListGenreView> {
  final chipNames = [
    "Action",
    "Crime",
    "Comedy",
    "Drama",
    "Action1",
    "Action2",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipNames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ActionChip(
                  onPressed: () {
                    widget.changeCurrentIndex(index);
                    widget.setMovieModel();
                  },
                  side: BorderSide(
                    width: 1,
                    color: widget.currentIndex == index
                        ? Colors.red
                        : Colors.black,
                  ),
                  backgroundColor: widget.currentIndex == index
                      ? Colors.yellow
                      : Colors.white,
                  label: Text(chipNames[index])),
            );
          }),
    );
  }
}
