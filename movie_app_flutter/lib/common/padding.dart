import 'package:flutter/material.dart';

class PaddingHelper {
  EdgeInsets getPaddingOnlyLeft(double size) {
    return EdgeInsets.only(left: size);
  }

  EdgeInsets getPaddingGenres() {
    return const EdgeInsets.only(top: 8.0, left: 10, right: 8.0);
  }

  EdgeInsets getPaddingOnlyTopAndBottom() {
    return const EdgeInsets.only(top: 8.0, bottom: 8.0);
  }
}
