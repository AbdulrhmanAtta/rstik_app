import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rstikapp/providers/app_provider.dart';
import 'package:rstikapp/screens/splash.dart';
import 'package:rstikapp/util/const.dart';
import 'models/cart.dart';
import 'util/const.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(

          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
           supportedLocales: [
            const Locale('en', 'GB'), // English, no country code
            const Locale('ru', 'RU'), // Hebrew, no country code
            // ... other locales the app supports
            ],
           localizationsDelegates: [
   // ... app-specific localization delegate[s] here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            ],
          title: Constants.appName,
          theme: appProvider.theme,
          darkTheme: Constants.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}