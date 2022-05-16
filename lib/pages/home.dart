import 'package:flutter/material.dart';

import '../components/git_repo/paginated_repos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: GitReposTablePaginated(),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
