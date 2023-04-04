import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:study_go_router/model/user_model.dart';
import 'package:study_go_router/screen/1_screen.dart';
import 'package:study_go_router/screen/2_screen.dart';
import 'package:study_go_router/screen/3_screen.dart';
import 'package:study_go_router/screen/error_screen.dart';
import 'package:study_go_router/screen/home_screen.dart';
import 'package:study_go_router/screen/login_screen.dart';

final routerProvider = Provider(
  (ref) {
    final authStateProvider = AuthNotifier(ref: ref);

    return GoRouter(
      initialLocation: '/login',
      errorBuilder: (context, state) => ErrorScreen(
        err: state.error.toString(),
      ),
      redirect: authStateProvider._redirectLogic,
      refreshListenable: authStateProvider,
      routes: authStateProvider.routes,
    );
  },
);

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({
    required this.ref,
  }) {
    ref.listen<UserModel?>(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final user = ref.read(userProvider);

    final loggingIn = state.location == '/login';

    if (user == null) {
      return loggingIn ? null : '/login';
    }
    if (loggingIn) {
      return '/';
    }

    return null;
  }

  final List<RouteBase> routes = <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'one',
          builder: (context, state) => OneScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'two',
              builder: (context, state) => TwoScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'three',
                  name: ThreeScreen.routeName,
                  builder: (context, state) => ThreeScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
  ];
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>(
  (ref) {
    return UserStateNotifier();
  },
);

class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  login({
    required String name,
  }) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
