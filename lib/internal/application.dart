import 'package:events_attendance/generated/l10n.dart';
import 'package:events_attendance/presentation/router/auth_guard.dart';
import 'package:events_attendance/presentation/router/router.gr.dart';
import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(
          360,
          640,
        ),
        builder: (context, _) {
          return MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            supportedLocales: S.delegate.supportedLocales,
            title: 'EventsAttendance',
            theme: AppTheme.lightTheme(),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );

        });
  }
}
