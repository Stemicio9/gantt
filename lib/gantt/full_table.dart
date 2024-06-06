
import 'package:flutter/material.dart';
import 'package:gantt/gantt/data_row/data_row.dart';
import 'package:gantt/gantt/extensions/iterable_extension.dart';
import 'package:gantt/gantt/legenda/legenda.dart';
import 'package:gantt/gantt/legenda/legenda_data.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'header_row/header_row.dart';
import 'row_data.dart';

class FullTableWidget extends StatelessWidget {
  final RowHeaderData rowHeaderData;
  final List<List<GanttElement>> ganttElements;
  final List<RowData> rows;
  final LinkedScrollControllerGroup linkedScrollControllerGroup = LinkedScrollControllerGroup();
  final int stepsForColumn;
  final double columnWidth;
  final Function onElementTapped;
  final bool legendaVisible;
  final List<LegendaData> legendaElements;
  FullTableWidget({Key? key,
    required this.rowHeaderData,
    required this.ganttElements,
    required this.rows,
    required this.onElementTapped,
    this.stepsForColumn = 4,
    this.columnWidth = 150,
    this.legendaVisible = false,
    this.legendaElements = const []
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Visibility(
              visible: legendaVisible && legendaElements.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: LegendaWidget(data: legendaElements),
              )
          ),
          HeaderRowWidget(rows: rowHeaderData,
              scrollController: linkedScrollControllerGroup.addAndGet(),
              columnWidth: columnWidth,
          ),
          ...rows.mapIndexed((e, i) => DataRowWidget(data: e,
            scrollController: linkedScrollControllerGroup.addAndGet(),
            ganttElements: ganttElements[i], stepWidth: columnWidth/stepsForColumn,
            onCellTapped: onElementTapped,
          ))
        ],
      ),
    );
  }
}
