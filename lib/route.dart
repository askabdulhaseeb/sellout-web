import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/auth/login_screen.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/dashboard_pages/add_product.dart';
import 'screens/dashboard_pages/bit_page.dart';
import 'screens/dashboard_pages/profile_page.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    //
    // Auth
    //
    GoRoute(
      path: LoginPage.routeName,
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    //
    // Dashboard
    //
    GoRoute(
      path: Dashboard.routeName,
      builder: (BuildContext context, GoRouterState state) => const Dashboard(),
    ),
    GoRoute(
      path: BitPage.routeName,
      builder: (BuildContext context, GoRouterState state) => const BitPage(),
    ),
    GoRoute(
      path: AddProductPage.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const AddProductPage(),
    ),
    GoRoute(
      path: ProfilePage.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const ProfilePage(),
    ),
  ],
);
