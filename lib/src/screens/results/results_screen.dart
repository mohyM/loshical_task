import 'package:flutter/material.dart';

import 'body/body.dart';

class ResultsScreen extends StatelessWidget {
  final String id;
  const ResultsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Body(id: id);
  }
}
