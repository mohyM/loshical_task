import 'package:flutter/material.dart';

import 'components/body.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to play'),
      ),
      body: const Body(),
    );
  }
}
