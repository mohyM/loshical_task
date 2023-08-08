import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../router/go_router_provider.dart';
import '../router/router_names.dart';

final acceptedImage = Provider<String>((ref) => 'a5');
final checkerProvider = ChangeNotifierProvider.autoDispose<CheckerProvider>(
    (ref) => CheckerProvider(ref));
//-----------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------
class CheckerProvider extends ChangeNotifier {
  Ref ref;
  bool isCorrectChoice = false;
  String? userChoise;
  Color userChoiceColor = Colors.white;
  CheckerProvider(this.ref);

  clearChecker() {
    userChoise = null;
    isCorrectChoice = false;
    userChoiceColor = Colors.white;
    notifyListeners();
  }

  onMove(String data) {
    if (data.contains(ref.read(acceptedImage))) {
      userChoiceColor = Colors.green;
    } else {
      userChoiceColor = Colors.red;
    }
    notifyListeners();
  }

  onAccept(String data) {
    if (data.contains(ref.read(acceptedImage))) {
      userChoiceColor = Colors.green;
      isCorrectChoice = true;
    } else {
      userChoiceColor = Colors.red;
      isCorrectChoice = false;
    }
    notifyListeners();
    ref.read(goRouterProvider).goNamed(result, pathParameters: {"id": data});
  }
}
