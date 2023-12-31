import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/src/providers/checker_provider.dart';
import 'package:loshical/src/widgets/answer_image.dart';
import 'package:loshical/src/widgets/hugged_child.dart';

import '../../../../utils/constants.dart';

class Body extends StatefulWidget {
  final String id;
  const Body({super.key, required this.id});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Consumer(
            builder: (context, ref, child) => ref
                    .read(checkerProvider)
                    .isCorrectChoice
                ? Column(
                    children: [
                      Text(
                        "Congratulations \n you win",
                        style:
                            TextStyle(color: Colors.orange[300], fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      ConfettiWidget(
                        confettiController: _controllerCenter,
                        blastDirectionality: BlastDirectionality
                            .explosive, // don't specify a direction, blast randomly
                        shouldLoop:
                            true, // start again as soon as the animation is finished
                        colors: const [
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                          Colors.orange,
                          Colors.purple
                        ], // manually specify the colors to be used
                        createParticlePath:
                            drawStar, // define a custom shape/path.
                      ),
                    ],
                  )
                : const Text(
                    "GAME OVER",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
          ),
          const Spacer(),
          HuggedChild(child: AnswerImage(assetPath: widget.id)),
          const Spacer(),
          Consumer(
            builder: (context, ref, child) => TextButton(
              onPressed: () => context.go('/'),
              child: const Text("Reset Game"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
