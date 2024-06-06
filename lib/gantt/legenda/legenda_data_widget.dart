import 'package:flutter/material.dart';
import 'package:gantt/gantt/legenda/legenda_data.dart';

class LegendaDataWidget extends StatelessWidget {
  final LegendaData data;
  final double circleRadius;
  final double paddingLeft;
  const LegendaDataWidget({Key? key,
    required this.data,
    this.paddingLeft = 8,
    this.circleRadius = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: circleRadius,
          height: circleRadius,
          decoration: BoxDecoration(
            color: data.color,
            shape: BoxShape.circle
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: paddingLeft),
          child: Text(
            data.text,
            style: TextStyle(
              color: data.textColor,
              fontSize: data.fontSize,
              fontWeight: data.fontWeight
            ),
          ),
        )
      ],
    );
  }
}
