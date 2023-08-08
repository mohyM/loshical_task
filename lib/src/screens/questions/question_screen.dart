import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loshical/src/router/router_names.dart';

import 'components/body.dart';

class QuestionScreen extends StatelessWidget {
  //
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loshical'),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(howTo),
            icon: const Icon(Icons.info_outlined),
          )
        ],
      ),
      body: const SafeArea(
        child: Body(),
      ),
    );
  }
}
