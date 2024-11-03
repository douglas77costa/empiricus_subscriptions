import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/routes/pages.dart';
import 'core/style/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      title: 'Empiricus',
      routerConfig: GoRouter(
        initialLocation: Routes.splash,
        routes: AppPages.pages,
      ),
    );
  }
}
