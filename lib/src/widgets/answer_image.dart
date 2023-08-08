import 'package:flutter/material.dart';
import 'package:loshical/src/widgets/hugged_child.dart';

class AnswerImage extends StatefulWidget {
  const AnswerImage(
      {super.key, required this.assetPath});
  final String assetPath;



  @override
  State<AnswerImage> createState() => _AnswerImageState();
}

class _AnswerImageState extends State<AnswerImage> {
  GlobalKey containerKey = GlobalKey();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return HuggedChild(
      key: containerKey,
      child: Image.asset(widget.assetPath),
    );
  }
}
