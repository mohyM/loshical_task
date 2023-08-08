import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/src/styles/app_colors.dart';
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
  Color userChoiceColor = AppColors.whiteColor;
  CheckerProvider(this.ref);

  clearChecker() {
    userChoise = null;
    isCorrectChoice = false;
    userChoiceColor = AppColors.whiteColor;
    notifyListeners();
  }

  onMove(String data) {
    if (data.contains(ref.read(acceptedImage))) {
      userChoiceColor = AppColors.greenColor;
    } else {
      userChoiceColor = AppColors.redColor;
    }
    notifyListeners();
  }

  onAccept(String data) {
    if (data.contains(ref.read(acceptedImage))) {
      userChoiceColor = AppColors.greenColor;
      isCorrectChoice = true;
    } else {
      userChoiceColor = AppColors.redColor;
      isCorrectChoice = false;
    }
    notifyListeners();
    ref.read(goRouterProvider).goNamed(result, pathParameters: {"id": data});
  }
}
