import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:common_test/app/navigation/routes.dart';
import 'package:common_test/generated/l10n.dart';
import 'package:common_test/presentation/feature/location_list/location_list_page.dart';

class LocationApp extends StatelessWidget {
  LocationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Location App',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: Routes.root,
        builder: (BuildContext context, GoRouterState state) => const LocationListPage(),
      ),
    ],
  );
}
