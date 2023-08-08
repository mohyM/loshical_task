import 'package:flutter/material.dart';
import '../../../widgets/answer_image.dart';
import '../../../widgets/assets.dart';
import '../../../widgets/hugged_child.dart';

class BottomImagesWidget extends StatelessWidget {
  const BottomImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: AssetManager.answerPaths
          .map(
            (e) => Draggable<String>(
              data: e,
              feedback: AnswerImage(assetPath: e),
              childWhenDragging: HuggedChild(child: Container()),
              child: AnswerImage(assetPath: e),
            ),
          )
          .toList(),
    );
  }
}
