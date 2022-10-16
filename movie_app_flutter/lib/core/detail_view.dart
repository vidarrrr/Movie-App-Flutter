import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/constants.dart';
import 'package:movie_app_flutter/common/padding.dart';
import 'package:movie_app_flutter/common/text_style.dart';
import 'package:movie_app_flutter/model/movie_model.dart';

import '../project/actor_view.dart';
import '../project/score_card_view.dart';
import '../project/watch_button_view.dart';

class DetailView extends StatefulWidget {
  const DetailView({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final plotSummary = "Plot Summary";
  final castPeople = "Cast & Crew";
  final noDescription = "No description";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      //the keyboard overflows when opened, so it is applied
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderDetailView(context),
              buildTitleAndAddWatch(),
              buildGenres(context),
              Padding(
                padding: PaddingHelper().getPaddingOnlyLeft(16),
                child: Text(
                  plotSummary,
                  style: TextStyleBold().getBoldStyle(32),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding:
                    PaddingHelper().getPaddingOnlyLeft(16).copyWith(right: 8.0),
                child: Text(
                  widget.movieModel.description ?? noDescription,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: PaddingHelper().getPaddingOnlyLeft(16),
                child: Text(
                  castPeople,
                  style: TextStyleBold().getBoldStyle(32),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              buildCast(context)
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCast(BuildContext context) {
    const noUserName = "No Actor Name";
    const noActorRole = "No Actor Role";

    return Padding(
      padding: PaddingHelper().getPaddingOnlyLeft(16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.movieModel.actors?.length ?? 0,
          itemBuilder: (context, index) {
            return ActorDetailView(
                actorName:
                    widget.movieModel.actors?[index].userName ?? noUserName,
                actorRole:
                    widget.movieModel.actors?[index].userRole ?? noActorRole,
                actorImage: widget.movieModel.actors?[index].userPhotoURL ??
                    Constants.owlImage);
          },
        ),
      ),
    );
  }

  Padding buildGenres(BuildContext context) {
    const splitChar = '|';
    return Padding(
      padding: PaddingHelper().getPaddingGenres(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.movieModel.genres?.split(splitChar).length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: PaddingHelper().getPaddingOnlyLeft(8),
                child: buildChip(index),
              );
            }),
      ),
    );
  }

  Chip buildChip(int index) {
    const splitChar = '|';
    const noGenre = "No genre";
    return Chip(
        side: const BorderSide(
          width: 1,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        label:
            Text(widget.movieModel.genres?.split(splitChar)[index] ?? noGenre));
  }

  Padding buildTitleAndAddWatch() {
    const noTitle = "No title";
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16, right: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.movieModel.title ?? noTitle,
                style: TextStyleBold().getBoldStyle(32),
              ),
              const SizedBox(
                height: 12,
              ),
              Text("${widget.movieModel.year}    ${widget.movieModel.runtime}")
            ],
          ),
          WatchButtonView(
            movieModel: widget.movieModel,
          )
        ],
      ),
    );
  }

  SizedBox buildHeaderDetailView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(32)),
            child: Image.network(
              widget.movieModel.poster ?? Constants.owlImage,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 16,
            child: ScoreCardView(),
          )
        ],
      ),
    );
  }
}
