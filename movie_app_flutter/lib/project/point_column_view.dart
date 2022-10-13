import 'package:flutter/material.dart';

import '../common/padding.dart';
import '../common/text_style.dart';

class PointColumnView extends StatelessWidget {
  const PointColumnView({super.key});
  final tenPoint = "9.9/10";
  final totalPointedPeople = "150,212";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingHelper().getPaddingOnlyLeft(16),
      child: Column(
        children: [
          const Icon(Icons.star, size: 24, color: Colors.yellow),
          Text(
            tenPoint,
            style: TextStyleBold().getBoldStyle(14),
          ),
          Text(totalPointedPeople)
        ],
      ),
    );
  }
}
