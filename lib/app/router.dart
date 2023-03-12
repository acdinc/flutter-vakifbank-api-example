import 'package:go_router/go_router.dart';

import '../../presentation/pages/auth_page.dart';
import '../../presentation/pages/bond_list_page.dart';
import '../../presentation/widgets/custom_error_widget.dart';

final router = GoRouter(
  routes: _routes,
  errorBuilder: (context, state) => const CustomErrorWidget(),
);

List<RouteBase> get _routes => <RouteBase>[
      GoRoute(
        name: Routes.auth.name,
        path: Routes.auth.path,
        builder: (context, state) => const AuthPage(),
        routes: <RouteBase>[
          GoRoute(
            name: Routes.bondList.name,
            path: Routes.bondList.path,
            builder: (context, state) => const BondListPage(),
          ),
        ],
      ),
    ];

enum Routes {
  auth('auth_page', '/'),
  bondList('bond_list_page', 'bond_list'),
  ;

  const Routes(this.name, this.path);

  final String name;
  final String path;
}
