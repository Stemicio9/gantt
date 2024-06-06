
import 'package:flutter/material.dart';
import 'package:gantt/gantt/row_data.dart';

class GanttElementsWidget extends StatelessWidget {
  final GanttElement data;
  // Index is needed to calculate distance from top
  final int index;
  final double stepWidth;
  final double taskHeight;
  final int totalElements;
  final double ganttTotalHeight;
  final Function onElementTapped;
  const GanttElementsWidget({Key? key,
    required this.data,
    required this.index,
    required this.stepWidth,
    required this.totalElements,
    required this.ganttTotalHeight,
    required this.onElementTapped,
    this.taskHeight = 50
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: data.startingStep*stepWidth,
        top: index*taskHeight + 15,
        child: GestureDetector(
          onTap: (){
            onElementTapped(data);
          },
          child: Container(
            decoration:
            BoxDecoration(
              color: data.color,
              borderRadius: const BorderRadius.all(Radius.circular(180))
            ),
            width: (data.endingStep - data.startingStep)*stepWidth,
            height: taskHeight*0.7,
            child: Center(
              child: Text(data.text, style:
              TextStyle(color: data.textColor, fontWeight: FontWeight.w900, fontSize: 18),),
            ),
          ),
        )
    );
  }
}
