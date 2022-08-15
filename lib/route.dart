import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'database/auth_methods.dart';
import 'models/product.dart';
import 'providers/prod_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/dashboard_pages/app_product_page/add_product.dart';
import 'screens/dashboard_pages/bit_page/bit_page.dart';
import 'screens/dashboard_pages/chat_page/chat_page.dart';
import 'screens/dashboard_pages/home_page/home_page.dart';
import 'screens/dashboard_pages/profile_page/profile_page.dart';
import 'screens/error_page/error_page.dart';
import 'screens/product_screens/product_detail_screen.dart';

final GoRouter router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation:
      // LoginPage.routeName,
      AuthMethods.uid.isEmpty ? LoginPage.routeName : Dashboard.routeName,
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
        builder: (BuildContext context, GoRouterState state) =>
            const Dashboard(),
        routes: <GoRoute>[
          GoRoute(
            path: ':${HomePage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
            routes: <GoRoute>[
              GoRoute(
                  name: ProductDetailScreen.routeName,
                  path: ':id',
                  builder: (BuildContext context, GoRouterState state) {
                    final Product _prod = Provider.of<ProdProvider>(context)
                        .product(state.params['id'] ?? '');
                    return ProductDetailScreen(product: _prod);
                  }),
            ],
          ),
          GoRoute(
            path: ':${BitPage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const BitPage(),
          ),
          GoRoute(
            path: ':${AddProductPage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const AddProductPage(),
          ),
          GoRoute(
            path: ':${ChatPage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const ChatPage(),
          ),
          GoRoute(
            path: ':${ProfilePage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const ProfilePage(),
          ),
        ]),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) =>
      const ErrorPage(),
);
