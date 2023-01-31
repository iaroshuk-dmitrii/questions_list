import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

import 'package:questions_list/business_logic/midlware.dart';
import 'package:questions_list/business_logic/redux.dart';
import 'package:questions_list/screens/initial_screen.dart';

void main() {
  final Store<AppState> store = Store(
    reducer,
    middleware: [HttpMiddleware()],
    initialState: AppState.initialState(),
  );
  runApp(StoreProvider(
    store: store,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'ru_Ru';
    return MaterialApp(
      theme: ThemeData.dark(),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', 'RU')],
      home: const InitialScreen(),
    );
  }
}
