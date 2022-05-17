import 'package:flutter/material.dart';
import 'package:flutter_database_with_pagination/models/repo.dart';

import '../../services/api_git_services.dart';

class GitReposDataSource extends DataTableSource {
  late final List<Repo> _data = [];

  GitReposDataSource() {
    fetchGitReposByUser(username: 'rogeriomq').then((value) {
      _data.clear();
      _data.addAll(value);
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  @override
  DataRow? getRow(int index) {
    if (index < _data.length) {
      return DataRow.byIndex(
        index: index,
        cells: [
          DataCell(Text(_data[index].id.toString())),
          DataCell(Text(_data[index].name)),
          DataCell(Text(_data[index].description)),
        ],
      );
    }
    return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
