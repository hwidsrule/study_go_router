import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_go_router/layout/default_layout.dart';

class OneScreen extends StatelessWidget {
  const OneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'one',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: const Text('pop'),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
