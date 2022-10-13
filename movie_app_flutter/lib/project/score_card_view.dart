import 'package:flutter/material.dart';
import 'package:movie_app_flutter/project/point_column_view.dart';
import 'package:movie_app_flutter/project/rate_column_view.dart';

import '../common/padding.dart';
import 'metascore_column_view.dart';

class ScoreCardView extends StatelessWidget {
  const ScoreCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 12,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), bottomLeft: Radius.circular(32))),
        child: Padding(
          padding: PaddingHelper().getPaddingOnlyTopAndBottom(),
          child: Row(
            // is 3 row a good idea or bad one?
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              PointColumnView(),
              RateColumnView(),
              MetascoreColumnView()
            ],
          ),
        ),
      ),
    );
  }
}
