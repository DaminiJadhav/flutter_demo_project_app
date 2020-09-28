

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TablePaginatedApp extends StatefulWidget{
  @override
  _TablePaginatedAppState createState() => _TablePaginatedAppState();
}

class _TablePaginatedAppState extends State<TablePaginatedApp> {
  var dt=EmployesDataSource();
  int _rowperpage=PaginatedDataTable.defaultRowsPerPage;
  bool check;

  void checked(value){
    setState(() {
      check=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginatated Table'),
      ),
      body: getDataTable(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget getDataTable(){
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('Employee', style: TextStyle(color: Color(0xFF4C4C4C), fontWeight: FontWeight.bold, fontSize: 15),),
        columns: [
          DataColumn(
            label: Text("id"),
            numeric: false,
          ),
          DataColumn(
            label: Text("name"),
            numeric: false,
          ),
          DataColumn(
            label: Text("phone"),
            numeric: false,
          ),
          DataColumn(
            label: Text("add"),
            numeric: false,
          ),
        ],
        source: dt,
        onRowsPerPageChanged: (r){
          setState(() {
            _rowperpage=r;
          });
        },
        rowsPerPage: _rowperpage,
      ),
    );
  }
}


class EmployesDataSource extends DataTableSource{
  int _selectedCount = 0;
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index:index,
        onSelectChanged: (value){
          print('Row selected: $value');
        },
        cells: [
      DataCell(Text('#cel1s$index')),
      DataCell(Text('#cel2s$index')),
      DataCell(Text('#cel3s$index')),
      DataCell(Text('#cel4s$index')),

    ]);
    // TODO: implement getRow
    throw UnimplementedError();
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 50;

  @override
  int get selectedRowCount => _selectedCount;

}