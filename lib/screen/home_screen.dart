import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:study_go_router/layout/default_layout.dart';
import 'package:study_go_router/provider/auth_provider.dart';
import 'package:study_go_router/screen/1_screen.dart';
import 'package:study_go_router/screen/3_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/one');
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => OneScreen(),
              // ));
            },
            child: const Text('OneScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              // context.go('/one/two/three');
              context.goNamed(ThreeScreen.routeName);
            },
            child: const Text('ThreeScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/good');
            },
            child: const Text('ErrorScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            child: const Text('LogInScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(userProvider.notifier).logout();
            },
            child: const Text('LogOut'),
          ),
        ],
      ),
    );
  }
}
