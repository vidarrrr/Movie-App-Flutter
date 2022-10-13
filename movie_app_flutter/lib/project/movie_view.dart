import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/text_style.dart';

class MovieView extends StatefulWidget {
  const MovieView(
      {super.key,
      required this.title,
      required this.imageURL,
      required this.currentIndex,
      required this.index});
  final String title;
  final String imageURL;
  final int currentIndex;
  final int index;
  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final point = "8.2";
  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/questions/44276080/how-do-i-rotate-something-15-degrees-in-flutter
    return RotationTransition(
      turns: _calculateTurn(widget.index, widget.currentIndex),
      child: Opacity(
        opacity: widget.currentIndex == widget.index ? 1 : 0.25,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.68,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: movieImage(context),
              ),
              const SizedBox(
                height: 16,
              ),
              movieTitle(context),
              const SizedBox(
                height: 4,
              ),
              movieStar(point)
            ],
          ),
        ),
      ),
    );
  }

  Wrap movieStar(String text) {
    return Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ]);
  }

  Text movieTitle(BuildContext context) {
    return Text(
      widget.title,
      textAlign: TextAlign.center,
      style: TextStyleBold().getBoldStyle(20),
      //style: Theme.of(context)
      //    .textTheme
      //    .headline6
      //    ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Image movieImage(BuildContext context) {
    return Image.network(
      widget.imageURL,
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.45,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.45,
            child:
                const Placeholder()); //Text(error.toString().substring(0, 30));
      },
    );
  }

  Animation<double> _calculateTurn(int index, int currentIndex) {
    if (currentIndex == index) {
      return const AlwaysStoppedAnimation(0 / 360);
    } else if (index < currentIndex) {
      return const AlwaysStoppedAnimation(-10 / 360);
    } else {
      return const AlwaysStoppedAnimation(10 / 360);
    }
  }
}
