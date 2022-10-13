import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/padding.dart';

import '../common/text_style.dart';

class ActorDetailView extends StatefulWidget {
  const ActorDetailView(
      {super.key,
      required this.actorName,
      required this.actorRole,
      required this.actorImage});

  final String actorName;
  final String actorRole;
  final String actorImage;
  @override
  State<ActorDetailView> createState() => _ActorDetailViewState();
}

class _ActorDetailViewState extends State<ActorDetailView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingHelper().getPaddingOnlyLeft(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            child: ClipOval(
              child: Image.network(
                widget.actorImage,
                width: 64,
                height: 64,
                errorBuilder: (context, error, stackTrace) {
                  return Text(error.toString().substring(30));
                },
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.actorName,
            style: TextStyleBold().getBoldStyle(16),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(widget.actorRole)
        ],
      ),
    );
  }
}
