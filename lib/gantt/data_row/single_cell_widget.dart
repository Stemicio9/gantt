
import 'package:flutter/material.dart';
import 'package:gantt/gantt/row_data.dart';

class SingleCellWidget extends StatelessWidget {
  final SingleCellData data;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final double width;
  final double height;
  const SingleCellWidget({Key? key,
    required this.data,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFD9D9D9),
    this.borderWidth = 1,
    this.verticalPadding = 16.0,
    this.horizontalPadding = 0.0,
    this.width = 150,
    this.height = 150
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        color: backgroundColor,
      ),
      child: Container(),
    );
  }
}
