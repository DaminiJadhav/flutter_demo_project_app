


import 'package:flutter/material.dart';

class TableApp extends StatelessWidget{
  bool check=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Table'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Text(
                'Students',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          DataTable(
            columns: [
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Class')),
              DataColumn(label: Text('City'),),
            ],
            rows: [
              DataRow(
                onSelectChanged: (bool selected){
                  if(selected){
                    check=selected;
                  }
                },
                cells: [
                  DataCell(Text('1')),
                  DataCell(Text('abc')),
                  DataCell(Text('BCS')),
                  DataCell(Text('PUNE')),
                ]
              ),
              DataRow(
                  cells: [
                    DataCell(Text('2')),
                    DataCell(Text('damini')),
                    DataCell(Text('MCS')),
                    DataCell(Text('chinchwad')),
                  ]
              ),
              DataRow(
                  cells: [
                    DataCell(Text('3')),
                    DataCell(Text('dsfh')),
                    DataCell(Text('Bcom')),
                    DataCell(Text('PUNE')),
                  ]
              ),
              DataRow(
                  cells: [
                    DataCell(Text('4')),
                    DataCell(Text('shgs')),
                    DataCell(Text('BA')),
                    DataCell(Text('satara')),
                  ]
              )
            ],
          )
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}