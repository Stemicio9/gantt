
/*
 All the data elements are in this file
*/

import 'dart:math';

import 'package:flutter/material.dart';

class RowHeaderData {
  final List<String> headers;
  final List<HeaderData> elements;
  const RowHeaderData({required this.headers, required this.elements});
}

class HeaderData {
  final List<String> values;
  const HeaderData({required this.values});
}

class RowData {
  final String firstColumnValue;
  final List<SingleCellData> elements;
  const RowData({required this.elements, required this.firstColumnValue});
}

class SingleCellData {
}

class GanttElement {
  // here is a fixed enum or we threat it as string and a color?
  final Color color;
  final Color textColor;
  final String text;
  final int startingStep;
  final int endingStep;
  const GanttElement({required this.text, required this.color,
    required this.startingStep, required this.endingStep, this.textColor = Colors.white});
}



Future<RowHeaderData> getDummyRowDataAsFuture(){
  List<String> headers = ['Data', 'Ora'];
  List<HeaderData> elements = List.empty(growable: true);
  elements.add(const HeaderData(values: ['1 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['1 gen 2024', '04:00']));
  elements.add(const HeaderData(values: ['1 gen 2024', '08:00']));
  elements.add(const HeaderData(values: ['1 gen 2024', '12:00']));
  elements.add(const HeaderData(values: ['1 gen 2024', '16:00']));
  elements.add(const HeaderData(values: ['1 gen 2024', '20:00']));
  elements.add(const HeaderData(values: ['2 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['3 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['4 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['5 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['6 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['7 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['8 gen 2024', '00:00']));
  elements.add(const HeaderData(values: ['9 gen 2024', '00:00']));
  RowHeaderData element = RowHeaderData(headers: headers, elements: elements);
  return Future.value(element);
}

int dummyColumns = 15;
int dummyRows = 25;


RowHeaderData getDummyRowHeaderData(){
  List<String> headers = ['Data', 'Ora'];
  List<HeaderData> elements = List.empty(growable: true);
  for(var i = 0; i<dummyColumns; i++){
    elements.add(HeaderData(values: ['${i.toString()} gen 2024', '00:00']));
  }
  RowHeaderData element = RowHeaderData(headers: headers, elements: elements);
  return element;
}

List<RowData> getDummyRowData(){
  List<RowData> result = List.empty(growable: true);
  for(var i = 0; i<dummyRows; i++){
    result.add(
        RowData(elements: compileRowCellsDummy(dummyColumns), firstColumnValue: 'OdP: 123456'
    ));
  }
  return result;
}

List<SingleCellData> compileRowCellsDummy(int numberOfElements){
  List<SingleCellData> result = List.filled(numberOfElements, SingleCellData());
  return result;
}

List<List<GanttElement>> dummyGanttElements(int numberOfElementsPerRow){
  List<List<GanttElement>> result = List.filled(dummyRows,
      createDummySingleRowList(numberOfElementsPerRow)
  );
  return result;
}


List<GanttElement> createDummySingleRowList(int numberOfElementsPerRow){
  List<GanttElement> result = List.empty(growable: true);
  for (var i = 0; i < numberOfElementsPerRow; i++) {
    GanttElement newElement = GanttElement(
        text: 'LV${i.toString()}',
        color: Random().nextInt(20) % 2 == 0 ? Colors.blueAccent : Colors.amber,
        startingStep: Random().nextInt(20),
        endingStep: Random().nextInt(10) + 21);
    result.add(newElement);
  }
  return result;
}

