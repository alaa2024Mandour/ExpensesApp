import 'package:flutter/material.dart';
class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
          child: FractionallySizedBox(
            heightFactor: fill,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10) ,
                    topRight: Radius.circular(10) ,
                  ),
                  color: isDark ?
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)
                      :Theme.of(context).colorScheme.primary,
                )),
          ),

        )
    );
  }
}
