import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/src/providers/checker_provider.dart';
import 'package:loshical/src/router/go_router_provider.dart';
import 'package:loshical/src/widgets/hugged_child.dart';
import 'package:loshical/src/widgets/question_image.dart';

import '../../../widgets/answer_image.dart';
import '../../../widgets/assets.dart';
import '../../../router/router_names.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Color caughtColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loshical'),
        actions: [
          IconButton(
            onPressed: () {
              // context.goNamed(result, pathParameters: {"id": "5"});
              context.goNamed(howTo);
            },
            icon: const Icon(Icons.info_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Text('Choose the image that completes the pattern: '),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: AssetManager.questionPaths
                    .map(
                      (e) => e.contains('q2')
                          ? // building Drag Target Widget
                          Consumer(
                              builder: (context, ref, child) {
                                var checkerViewModel =
                                    ref.read(checkerProvider);
                                return DragTarget<String>(
                                  onAccept: (String data) {
                                    checkerViewModel.onAccept(data);
                                  },
                                  onLeave: (data) {
                                    checkerViewModel.clearChecker();
                                  },
                                  onWillAccept: (data) {
                                    return true;
                                  },
                                  onMove: (DragTargetDetails<String> data) {
                                    print('onAccept move ${data.data}');
                                    checkerViewModel.onMove(data.data);
                                  },
                                  builder: (
                                    BuildContext context,
                                    List<dynamic> accepted,
                                    List<dynamic> rejected,
                                  ) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: ref
                                              .watch(checkerProvider)
                                              .userChoiceColor,
                                        ),
                                      ),
                                      child: QuestionImage(
                                        assetPath: e,
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : QuestionImage(
                              assetPath: e,
                            ),
                    )
                    .toList(),
              ),
              const Spacer(),
              const Text('Which of the shapes below continues the sequence'),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: AssetManager.answerPaths
                    .map(
                      (e) => Draggable<String>(
                        data: e,
                        onDraggableCanceled: (velocity, offset) {
                          print('onDraggableCanceled');
                        },
                        onDragStarted: () {
                          print("draging");
                        },
                        feedback: AnswerImage(
                          assetPath: e,
                        ),
                        childWhenDragging: HuggedChild(child: Container()),
                        child: AnswerImage(
                          assetPath: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 42,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
