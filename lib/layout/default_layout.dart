import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;

  const DefaultLayout({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(route.location),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),
    );
  }
}
