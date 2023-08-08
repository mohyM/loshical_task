import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/src/widgets/assets.dart';

import '../../../providers/checker_provider.dart';
import '../../../widgets/question_image.dart';



class TopImagesWidget extends StatelessWidget {
  const TopImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: AssetManager.questionPaths
          .map(
            (e) => e.contains('q2')
                ? Consumer(
                    builder: (context, ref, child) => DragTarget<String>(
                      onAccept: (String data) {
                        ref.watch(checkerProvider).onAccept(data);
                      },
                      onLeave: (data) {
                        ref.watch(checkerProvider).clearChecker();
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onMove: (DragTargetDetails<String> data) {
                        ref.watch(checkerProvider).onMove(data.data);
                      },
                      builder: (_, __, ___) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ref.watch(checkerProvider).userChoiceColor,
                          ),
                        ),
                        child: QuestionImage(assetPath: e),
                      ),
                    ),
                  )
                : QuestionImage(assetPath: e),
          )
          .toList(),
    );
  }
}
