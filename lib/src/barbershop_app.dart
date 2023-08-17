import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barbershop/src/core/global/barbershop_nav_global_key.dart';
import 'package:barbershop/src/core/ui/theme/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';

import 'features/register/user/user_register_page.dart';
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
          navigatorKey: BarbershopNavGlobalKey.instance.navKey,
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/auth/register/barbershop': (_) => const Text('barbershop page'),
            '/home/adm': (_) => const Text('adm'),
            '/home/employee': (_) => const Text('employee'),
          },
        );
      },
    );
  }
}
