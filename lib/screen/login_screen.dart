import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_go_router/layout/default_layout.dart';
import 'package:study_go_router/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProvider.notifier);

    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'LoginScreen',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: const Text('Log In'),
            onPressed: () => state.login(name: 'wangseobang'),
          ),
        ],
      ),
    );
  }
}
