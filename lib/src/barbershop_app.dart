import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barbershop/src/core/global/barbershop_nav_global_key.dart';
import 'package:barbershop/src/core/ui/theme/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/employee/register/employee_register_page.dart';
import 'features/employee/schedule/employee_schedule_page.dart';
import 'features/home/adm/home_adm_page.dart';
import 'features/home/employee/home_employee.dart';
import 'features/register/barbershop/barbershop_register_page.dart';
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
            '/auth/register/barbershop': (_) => const BarbershopRegisterPage(),
            '/home/adm': (_) => const HomeAdmPage(),
            '/home/employee': (_) => const HomeEmployee(),
            '/employee/register': (_) => const EmployeeRegisterPage(),
            '/employee/schedule': (_) => const EmployeeSchedulePage(),
            'schedule': (_) => const SchedulePage()
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          locale: const Locale('pt', 'BR'),
        );
      },
    );
  }
}
