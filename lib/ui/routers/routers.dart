import 'package:auto_route/auto_route.dart';
import 'package:worker/ui/routers/routers.gr.dart';

const transitionsBuilder = TransitionsBuilders.fadeIn;
const durationInMilliseconds = 100;

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    CustomRoute(
      page: SplashRoute.page,
      path: '/',
      transitionsBuilder: transitionsBuilder,
      durationInMilliseconds: durationInMilliseconds,
    ),
    CustomRoute(
      page: LoginRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: durationInMilliseconds,
    ),
    CustomRoute(
      page: SignInRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: durationInMilliseconds,
    ),
    CustomRoute(
      page: UserMainRoute.page,
      transitionsBuilder: transitionsBuilder,
      durationInMilliseconds: durationInMilliseconds,
    ),
  ];
}
