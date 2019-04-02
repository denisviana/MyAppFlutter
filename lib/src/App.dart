
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/common/routes.dart';
import 'package:my_flutter_app/src/screens/login/login.dart';

class MyApp extends StatelessWidget{

  static MaterialApp _app;

  @override
  Widget build(BuildContext context) {

    _app = MaterialApp(
      title: "My App",
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Color(0xFF00bcd4),
        primaryColorDark: Color(0xFF00838f),
        accentColor: Color(0xFF00bcd4),
        brightness: Brightness.dark,
        fontFamily: 'Didact Gothic',

        inputDecorationTheme: InputDecorationTheme(

          labelStyle: TextStyle(color: Color(0xFF00bcd4)),
          hintStyle: TextStyle(color: Colors.black38),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF00bcd4))),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF00bcd4)))
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
      ],
      /*routes: {
        MyRoutes.login: (context) => LoginScreen(),
      },
      initialRoute: MyRoutes.login,*/
      home: LoginScreen(),
    );

    return _app;
  }

}