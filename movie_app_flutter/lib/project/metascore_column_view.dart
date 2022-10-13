import 'package:flutter/material.dart';

import '../common/text_style.dart';

class MetascoreColumnView extends StatelessWidget {
  const MetascoreColumnView({super.key});
  final metaScorePoint = "20";
  final metaScore = "Metascore";
  final reviews = "20 critic reviews";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Container(
            color: Colors.green,
            width: 25,
            child: Text(
              metaScorePoint,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          metaScore,
          style: TextStyleBold().getBoldStyle(14),
        ),
        Text(
          reviews,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )
      ],
    );
  }
}
