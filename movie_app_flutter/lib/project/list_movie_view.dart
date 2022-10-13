import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants.dart';
import 'package:movie_app_flutter/model/movie_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../core/detail_view.dart';
import 'movie_view.dart';

class ListMovieView extends StatefulWidget {
  const ListMovieView({super.key, required this.movieModelList});

  final List<MovieModel> movieModelList;
  @override
  State<ListMovieView> createState() => _ListMovieViewState();
}

class _ListMovieViewState extends State<ListMovieView> {
  int _listViewCurrentIndex = 0;

  void changeListViewCurrentIndex(int index) {
    setState(() {
      _listViewCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.movieModelList.length,
          itemBuilder: (context, index1) {
            return VisibilityDetector(
              key: Key(index1.toString()),
              onVisibilityChanged: ((info) {
                if (info.visibleFraction == 1) {
                  changeListViewCurrentIndex(index1);
                }
              }),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailView(
                          movieModel: widget.movieModelList[index1]);
                    },
                  ));
                },
                child: MovieView(
                  title: widget.movieModelList[index1].title ?? "",
                  imageURL: widget.movieModelList[index1].poster ??
                      Constants.owlImage,
                  index: index1,
                  currentIndex: _listViewCurrentIndex,
                ),
              ),
            );
          }),
    );
  }
}
