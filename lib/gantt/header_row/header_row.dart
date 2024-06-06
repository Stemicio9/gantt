import 'package:flutter/material.dart';
import 'package:gantt/gantt/row_data.dart';
import 'package:gantt/gantt/header_row/single_header_widget.dart';

/*
 HeaderRow represents the header of the Gantt table
 Is formed by a list of RowData that represents the list of possible
 headers of the Gantt table.
 In the first example it contains Date and Hour
 Consider using mappers to map the input data in RowData eventually
*/
class HeaderRowWidget extends StatelessWidget {
  final RowHeaderData rows;
  final ScrollController scrollController;
  final double height;
  final double firstColumnWidth;
  final double columnWidth;
  const HeaderRowWidget(
      {Key? key,
      required this.rows,
      required this.scrollController,
      this.height = 70,
      this.firstColumnWidth = 180,
      this.columnWidth = 150
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          // this section represents the initial Box of the header
          SizedBox(
            width: firstColumnWidth,
            child: SingleHeaderWidget(
              element: HeaderData(values: rows.headers),
              crossAxisAlignment: CrossAxisAlignment.center,
              backgroundColor: const Color(0xFFead6d9),
            ),
          ),
          // this section represents the second part of the header
          // all the data except for the header definitions
           Expanded(
             child: Scrollbar(
               key: UniqueKey(),
               controller: scrollController,
               child: SingleChildScrollView(
                  key: UniqueKey(),
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    ...rows.elements.map((e) =>
                        SingleHeaderWidget(element: e,
                          backgroundColor: const Color(0xFFA71930),
                          textColor: Colors.white, headerWidth: columnWidth,
                        ))
                        .toList()
                      ]
                  ),
                ),
             ),
           ),

        ],
    );
  }
}
