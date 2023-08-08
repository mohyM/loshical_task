import 'package:flutter/material.dart';

import 'bottom_images_widget.dart';
import 'top_images_widget.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text('Choose the image that completes the pattern: '),
              SizedBox(height: 16),
              TopImagesWidget(),
              Spacer(),
              Text('Which of the shapes below continues the sequence'),
              SizedBox(height: 16),
              BottomImagesWidget(),
              SizedBox(height: 42),
            ],
          ),
        ),
      );
}
