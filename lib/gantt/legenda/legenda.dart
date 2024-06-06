import 'package:flutter/material.dart';
import 'package:gantt/gantt/extensions/iterable_extension.dart';
import 'package:gantt/gantt/legenda/legenda_data.dart';
import 'package:gantt/gantt/legenda/legenda_data_widget.dart';

class LegendaWidget extends StatelessWidget {
  final String legendaTitle;
  final List<LegendaData> data;
  const LegendaWidget({Key? key,
    required this.data,
    this.legendaTitle = 'Legenda status'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(legendaTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              ...data.mapIndexed((e, i) => Padding(
                padding: i != 0 ? const EdgeInsets.symmetric(horizontal: 8.0) : const EdgeInsets.only(right: 8.0),
                child: LegendaDataWidget(data: e,),
              )).toList()
            ],
          ),
        )
      ],
    );
  }
}
