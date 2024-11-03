import 'package:go_router/go_router.dart';

import '../../modules/details/details_page.dart';
import '../../modules/home/home_page.dart';
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
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        final name = state.pathParameters['name'] as String;
        return HomePage(name: name);
      },
    ),
    GoRoute(
      path: Routes.details,
      builder: (context, state) {
        final slug = state.pathParameters['slug'] as String;
        return DetailsPage(slug: slug);
      },
    ),
  ];
}
