import 'package:flutter/material.dart';
import 'package:inherited_notifier_demo/slide_data.dart';

class SliderInheritedNotifier extends InheritedNotifier<SlideData> {
  const SliderInheritedNotifier(
      {required Widget child, required SlideData slideData})
      : super(child: child, notifier: slideData);

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
          ?.notifier
          ?.value ??
      0;
}
