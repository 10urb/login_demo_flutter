import 'package:flutter/material.dart';
import 'package:login_demo_flutter/constants/main_helpers/providers.dart';
import 'package:login_demo_flutter/constants/main_helpers/routes/named_routes.dart';
import 'package:login_demo_flutter/constants/main_helpers/routes/route_strings.dart';
import 'package:login_demo_flutter/constants/project_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const LoginDemo());

class LoginDemo extends StatelessWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        initialRoute: RouteStrings.LOGIN,
        theme: ProjectTheme.themeData,
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(),
        routes: NamedRoutes.routes,
      ),
    );
  }
}
