library awesome_rating;

import 'package:flutter/material.dart';
import 'contents/content.dart';


typedef RatingChangeCallback = void Function(double rating);

class AwesomeStarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final Color? borderColor;
  final double size;
  final bool allowHalfRating;
  final RatingWidget? customRatingWidget;
  final IconData? filledIconData;
  final IconData? halfFilledIconData;
  final IconData? defaultIconData;
  final double spacing;

  const AwesomeStarRating({
    Key? key,
    this.starCount = 5,
    this.spacing = 0.0,
    this.rating = 0.0,
    this.defaultIconData,
    this.onRatingChanged,
    this.color,
    this.borderColor,
    this.size = 25,
    this.customRatingWidget,
    this.filledIconData,
    this.halfFilledIconData,
    this.allowHalfRating = true,
  }) : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if(customRatingWidget != null){
      if (index >= rating) {
        icon = Container(padding: const EdgeInsets.only(right: 4.0),child: customRatingWidget!.empty);
      } else if (index > rating - (allowHalfRating ? 0.5 : 1.0) && index < rating) {
        icon = Container(padding: const EdgeInsets.only(right: 4.0),child: customRatingWidget!.half);
      } else {
        icon = Container(padding: const EdgeInsets.only(right: 4.0),child: customRatingWidget!.full);
      }
    }else{
      if (index >= rating) {
        icon = Icon(
          defaultIconData ?? Icons.star_border,
          color: borderColor ?? Theme.of(context).primaryColor,
          size: size,
        );
      } else if (index > rating - (allowHalfRating ? 0.5 : 1.0) && index < rating) {
        icon = Icon(
          halfFilledIconData ?? Icons.star_half,
          color: color ?? Theme.of(context).primaryColor,
          size: size,
        );
      } else {
        icon = Icon(
          filledIconData ?? Icons.star,
          color: color ?? Theme.of(context).primaryColor,
          size: size,
        );
      }
    }

    return GestureDetector(
      onTap: () {
        if (onRatingChanged != null) onRatingChanged!(index + 1.0);
      },
      onHorizontalDragUpdate: (dragDetails) {
        RenderBox box = context.findRenderObject() as RenderBox;
        var pos = box.globalToLocal(dragDetails.globalPosition);
        var i = pos.dx / size;
        var newRating = allowHalfRating ? i : i.round().toDouble();
        if (newRating > starCount) {
          newRating = starCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        if (onRatingChanged != null) onRatingChanged!(newRating);
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: spacing,
          children:List.generate(starCount, (index) => buildStar(context, index))),
    );
  }
}


