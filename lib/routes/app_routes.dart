import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seequenze_task/pages/details_page.dart';
import 'package:seequenze_task/pages/home_page.dart';
import 'package:seequenze_task/pages/login_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsPage(
              imgUrls: 'assets/images/food1.jpg',
              title: 'Spicy seasoned seafood noodles',
            );
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginPage();
          },
        ),
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            }),
      ],
    ),
  ],
);
