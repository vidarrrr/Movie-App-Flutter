import 'package:flutter/material.dart';

import '../common/text_style.dart';

class RateColumnView extends StatelessWidget {
  const RateColumnView({super.key});
  final rateThis = "Rate this";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.star_border, size: 24),
        Text(
          rateThis,
          style: TextStyleBold().getBoldStyle(14),
        )
      ],
    );
  }
}
