import 'package:flutter/material.dart';
import 'package:graduationproject/shopping_list.dart';

class AnimationRoute extends PageRouteBuilder {
  final Page;
  AnimationRoute({this.Page})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => Page,
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, animationtwo, child) {
              var begin = 0.0;
              var end = 1.0;
              var curvesAnimation =
                  CurvedAnimation(parent: animation, curve: Curves.easeIn);
              var tween = Tween(begin: begin, end: end);
              return ScaleTransition(
                  scale: tween.animate(curvesAnimation), child: child);
            });
}
