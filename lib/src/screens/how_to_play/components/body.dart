import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../widgets/assets.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to play'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text('Double click on the instructions to zoom'),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: PhotoView(
                enablePanAlways: true,
                imageProvider: const AssetImage(
                  AssetManager.howto,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
