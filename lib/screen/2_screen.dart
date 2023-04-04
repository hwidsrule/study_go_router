import 'package:flutter/material.dart';
import 'package:study_go_router/layout/default_layout.dart';

class TwoScreen extends StatelessWidget {
  const TwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Text('two'),
      ),
    );
  }
}
