
import 'package:flutter/material.dart';

class LegendaData {
  final Color color;
  final Color textColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  LegendaData({required this.text,
    this.color = Colors.greenAccent,
    this.textColor = Colors.black,
    this.fontSize = 14, this.fontWeight = FontWeight.w400
  });
}

List<LegendaData> createDummyLegendaData(){
  List<LegendaData> result = List.empty(growable: true);
  result.add(LegendaData(text: 'Concluso', color: Colors.green));
  result.add(LegendaData(text: 'Avanzato parzialmente', color: Colors.yellow));
  result.add(LegendaData(text: 'Non elaborato', color: Colors.red));
  return result;
}