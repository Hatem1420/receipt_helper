import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:receipt_helper/core/widgets/nav_bar.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_helper/features/scan/presentation/pages/scan_feature_screen.dart';
import 'package:receipt_helper/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:receipt_helper/features/home/presentation/pages/home_feature_screen.dart';
import 'package:receipt_helper/features/home/presentation/cubit/home_cubit.dart';
import 'package:receipt_helper/features/loading/presentation/pages/loading_feature_screen.dart';
import 'package:receipt_helper/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:receipt_helper/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:receipt_helper/features/auth/presentation/cubit/auth_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.loading,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => BlocProvider(
                  create: (context) => HomeCubit(GetIt.I.get()),
                  child: const HomeFeatureScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.scan,
                builder: (context, state) => BlocProvider(
                  create: (context) => ScanCubit(GetIt.I.get()),
                  child: const ScanFeatureScreen(),
                ),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: Routes.loading,
        builder: (context, state) => BlocProvider(
          create: (context) => LoadingCubit(GetIt.I.get()),
          child: const LoadingFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
