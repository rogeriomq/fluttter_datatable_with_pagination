import 'dart:developer';

import 'package:flutter/material.dart';

class GitReposDataSource extends DataTableSource {
  static String _fakeDescription(int index) {
    String txt = 'Description of the index:[$index] repo.';
    if (index % 2 == 0) {
      return '$txt + sdfsdfsdf sdfsd fdsf dsfds fdsf dsf dsfds fds fdsf dsf dsf ';
    }
    return txt;
  }

  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "name": "Item $index",
            "description": _fakeDescription(index)
          });

  @override
  DataRow? getRow(int index) {
    if (index < _data.length) {
      debugPrint('index: $index');
      return DataRow.byIndex(
        index: index,
        cells: [
          DataCell(
            Text(
              _data[index]['id'].toString(),
              style: TextStyle(
                  color: Colors.blue[500], backgroundColor: Colors.black87),
            ),
          ),
          DataCell(Text(_data[index]['name'].toString())),
          DataCell(Text(_data[index]['description'].toString())),
        ],
      );
    }
    return null;
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
