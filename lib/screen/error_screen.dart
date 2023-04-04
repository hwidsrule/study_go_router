import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_go_router/layout/default_layout.dart';

class ErrorScreen extends StatelessWidget {
  final String err;

  const ErrorScreen({
    required this.err,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            err,
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: const Text('go home'),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    );
  }
}
