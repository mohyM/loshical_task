import 'package:flutter/material.dart';

import 'components/body.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = 'result';

  final String id;
  const ResultsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result'),
      ),
      body: SafeArea(
        child: Body(id: id),
      ),
    );
  }
}
