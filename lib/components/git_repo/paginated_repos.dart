import 'package:flutter/material.dart';
import 'package:flutter_database_with_pagination/components/git_repo/datasource_gitrepos.dart';

class GitReposTablePaginated extends StatefulWidget {
  const GitReposTablePaginated({super.key});

  @override
  State<GitReposTablePaginated> createState() => _GitReposTablePaginatedState();
}

class _GitReposTablePaginatedState extends State<GitReposTablePaginated> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    debugPrint('#####');
    return PaginatedDataTable(
      source: GitReposDataSource(),
      header: const Text('Rogério\'s Repositories'),
      columns: const [
        DataColumn(label: Text('Id')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Description'))
      ],
      columnSpacing: 100,
      horizontalMargin: 10,
      headingRowHeight: 30,
      showCheckboxColumn: false,
      sortAscending: true,
      rowsPerPage: _rowPerPage,
      onRowsPerPageChanged: (r) {
        debugPrint('r = $r');
        setState(() {
          _rowPerPage = r!;
        });
      },
    );
  }
}
