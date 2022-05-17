import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_database_with_pagination/models/repo.dart';
import 'package:http/http.dart' as http;

Future<List<Repo>> fetchGitReposByUser({required String username}) async {
  debugPrint('userName: $username');
  if (username.isEmpty) {
    throw Exception('Username is required');
  }

  final endpoint = 'https://api.github.com/users/$username/repos';
  final response = await http.get(Uri.parse(endpoint));
  if (response.statusCode == 200) {
    final bodyMap = jsonDecode(utf8.decode(response.bodyBytes));
    final listOfRepo = bodyMap.map<Repo>((item) => Repo.fromMap(item)).toList();
    debugPrint('$listOfRepo[0]');
    return listOfRepo;
  }

  throw Exception('Bad request');
}
