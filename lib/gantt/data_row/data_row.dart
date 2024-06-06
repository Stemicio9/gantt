

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gantt/gantt/data_row/single_cell_widget.dart';
import 'package:gantt/gantt/extensions/iterable_extension.dart';
import 'package:gantt/gantt/row_data.dart';
import 'package:gantt/gantt/header_row/single_header_widget.dart';

import 'gantt_elements_widget.dart';

class DataRowWidget extends StatelessWidget {
  final double firstColumnWidth;
  final double firstColumnHeight;
  final ScrollController scrollController;
  final RowData data;
  final List<GanttElement> ganttElements;
  final double taskHeightWithMargins;
  final double minHeight;
  final double stepWidth;
  final Function onCellTapped;

  const DataRowWidget({Key? key,
    this.firstColumnWidth = 180,
    this.firstColumnHeight = 150,
    required this.scrollController,
    required this.data,
    required this.ganttElements,
    this.taskHeightWithMargins = 50,
    this.minHeight = 30,
    required this.stepWidth,
    required this.onCellTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: firstColumnWidth,
            child: SingleHeaderWidget(
              element: HeaderData(values: [data.firstColumnValue]),
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              backgroundColor: const Color(0xFFA71930),
              textColor: Colors.white
            ),
          ),
          // this section is the core part of the widget tree
          // it represents the Gantt section with single elements
          Expanded(
            child: SingleChildScrollView(
                key: UniqueKey(),
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: max(minHeight,ganttElements.length*taskHeightWithMargins + minHeight),
                  child: Stack(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...data.elements.map((e) =>
                                SingleCellWidget(
                                  data: e,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                ))
                                .toList()
                          ]
                      ),
                      // gant element height: 50
                      // Padding gantt element 10
                      ...ganttElements.mapIndexed((e, i) =>
                          GanttElementsWidget(
                            data: e, index: i, stepWidth: stepWidth,
                            totalElements: ganttElements.length,
                            ganttTotalHeight: taskHeightWithMargins,
                            onElementTapped : onCellTapped
                          ))
                          .toList()

                    ],
                  ),
                ),
              ),

          ),
        ],
      ),
    );
  }
}

