import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barbershop/src/core/ui/theme/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';

import 'features/splash/splash_page.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'Barbershop',
          debugShowCheckedModeBanner: false,
          theme: BarbershopTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/home/adm': (_) => const Text('adm'),
            '/home/employee': (_) => const Text('employee'),
          },
        );
      },
    );
  }
}
