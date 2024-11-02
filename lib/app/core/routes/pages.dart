import 'package:go_router/go_router.dart';

import '../../modules/login/login_page.dart';
import '../../modules/splash/splash_page.dart';

part 'routes.dart';

class AppPages {
  AppPages._();
  static final pages = <RouteBase>[
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginPage(),
    ),
  ];
}
