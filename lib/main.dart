import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_c20_dokki/core/di/di.dart';
import 'package:news_c20_dokki/core/l10n/app_localizations.dart';
import 'package:news_c20_dokki/core/providers/app_config_provider.dart';
import 'package:news_c20_dokki/core/theme/app_colors.dart';
import 'package:news_c20_dokki/core/theme/app_theme.dart';
import 'package:news_c20_dokki/presentation/home/home_screen.dart';
import 'package:news_c20_dokki/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  ChuckerFlutter.showOnRelease = true;
  ChuckerFlutter.showNotification = true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      navigatorKey: ChuckerFlutter.navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: provider.themeMode,
      theme: AppTheme(LightColors()).theme,
      darkTheme: AppTheme(DarkColors()).theme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
