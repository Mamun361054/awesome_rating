import 'package:flutter/cupertino.dart';

class RatingWidget {
  ///when item fully rated then this widget to be used
  final Widget full;

  ///when item half rated then this widget to be used
  final Widget half;

  ///when item unrated then this widget to be used
  final Widget empty;

  const RatingWidget({required this.full, required this.half, required this.empty});
}
