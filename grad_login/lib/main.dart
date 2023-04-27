import 'package:flutter/material.dart';
import 'package:grad_login/providers/categoriesProvider.dart';
import 'package:grad_login/providers/drugProvider.dart';
import 'package:grad_login/screens/home_screen.dart';
import 'package:grad_login/screens/medicine_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/exams_screen.dart';
import 'providers/examProvider.dart';
import 'providers/userProvider.dart';
import 'providers/authProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ExamProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: Drugs(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'first demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 22, 36, 66),
          secondary: const Color.fromRGBO(167, 252, 132, 0.7),
        )),
        home: const LoginScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          RegisterFormScreen.routeName: (ctx) => const RegisterFormScreen(),
          ExamsScreen.routeName: (ctx) => const ExamsScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          MedicinesScreen.routeName: (context) => const MedicinesScreen(),
        },
      ),
    );
  }
}
