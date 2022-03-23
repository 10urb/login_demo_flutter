import 'package:flutter/material.dart';

class ProjectTheme {
  static ThemeData get themeData => ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        dialogBackgroundColor: Colors.white,
        errorColor: Colors.red.shade400,
        selectedRowColor: Colors.amber,
        appBarTheme: _appBarTheme,
        splashColor: Colors.amber,
        iconTheme: _iconTheme,
        dividerColor: Colors.transparent,
        progressIndicatorTheme: _progressIndicatorThemeData,
        primaryIconTheme: _primaryIconTheme,
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
        splashFactory: InkSplash.splashFactory,
        shadowColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          errorColor: Colors.red,
        ),
        textTheme: _textTheme,
        dialogTheme: _dialogTheme,
      );

  static TextTheme get _textTheme =>
      const TextTheme(bodyText2: TextStyle(color: Colors.black));

  static AppBarTheme get _appBarTheme => const AppBarTheme(
      centerTitle: true, backgroundColor: Colors.blueGrey, titleSpacing: 20);

  static IconThemeData get _primaryIconTheme =>
      const IconThemeData(color: Colors.teal);

  static IconThemeData get _iconTheme =>
      const IconThemeData(color: Colors.black);

  static get _dialogTheme =>
      const DialogTheme(backgroundColor: Colors.white, elevation: 50);

  static get _progressIndicatorThemeData =>
      const ProgressIndicatorThemeData(color: Colors.amber);
}
