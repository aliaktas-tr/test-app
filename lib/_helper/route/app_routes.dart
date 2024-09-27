import 'package:new_weedus/export.dart';
import 'package:new_weedus/view/user_view/test_user_view.dart';

final Duration _duration = Duration(milliseconds: 200);
final Duration _resetPageDuration = Duration(milliseconds: 350);
final Offset _begin = Offset(1.0, 0.0);
final Offset _end = Offset.zero;

CustomTransitionPage buildPageWithFadeTransition<T>(
    {required GoRouterState state, required Widget child, Duration? duration}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: duration ?? _duration,
      reverseTransitionDuration: duration ?? _duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child));
}

CustomTransitionPage buildPageWithSlideTransition<T>({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
              position: Tween(begin: _begin, end: _end).animate(animation),
              child: child));
}

final GoRouter appRoutes = GoRouter(observers: [
  FlutterSmartDialog.observer
], routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (context, state) => LandingView(), // InformationView(),
      routes: <RouteBase>[
        GoRoute(
            path: 'product',
            name: 'product',
            builder: (context, state) => ShopView()),
        GoRoute(
            path: 'product/checkout/:id',
            name: 'product/checkout/:id',
            builder: (context, state) => CheckoutView()),
        GoRoute(
            name: 'whereismyorder/:id',
            path: 'whereismyorder/:id',
            builder: (context, state) =>
                OrderTrackingView(id: state.pathParameters["id"])),
        GoRoute(
            name: 'settings',
            path: 'settings',
            pageBuilder: (context, state) => buildPageWithFadeTransition(
              state: state,
              child: PlaidTestPage(),
            ))
            //builder: (context, state) => TestUserView()),
      ])
]);
