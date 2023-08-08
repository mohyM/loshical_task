import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/src/screens/how_to_play/how_to_play_screen.dart';
import 'package:loshical/src/screens/questions/question_screen.dart';
import 'package:loshical/src/router/router_names.dart';
import 'package:loshical/src/screens/results/results_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: rootNavigationKey,
    routes: [
      GoRoute(
        path: '/',
        name: root,
        builder: (context, state) => QuestionScreen(
          key: state.pageKey,
        ),
        routes: [
          GoRoute(
            path: 'howTo',
            name: howTo,
            pageBuilder: (context, state) => MaterialPage(
              fullscreenDialog: true,
              child: HowToPlayScreen(
                key: state.pageKey,
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/result/:id',
        name: result,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ResultsScreen(
            id: id,
          );
        },
      ),
      // another sub-route
    ],
  );
});
