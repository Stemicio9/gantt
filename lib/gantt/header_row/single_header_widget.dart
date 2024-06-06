

import 'package:flutter/material.dart';
import 'package:gantt/gantt/row_data.dart';

class SingleHeaderWidget extends StatelessWidget {
  final HeaderData element;
  final Color backgroundColor;
  final Color textColor;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double verticalPadding;
  final double horizontalPadding;
  final double headerWidth;
  const SingleHeaderWidget({Key? key, required this.element,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 24.0,
    this.headerWidth = 150
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: headerWidth,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          ...element.values.map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
                    child: Text(e, style: TextStyle(color: textColor),),
                  )).toList()
        ],
      ),
    );
  }
}
