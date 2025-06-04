import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h2home/Splashscreen.dart';
import 'package:toastification/toastification.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff1976D2),
      systemNavigationBarDividerColor: Colors.white,
      systemStatusBarContrastEnforced: true
    ),
  );

  runApp(
    ToastificationWrapper(
      child: MaterialApp(
        theme: ThemeData(
          primaryIconTheme: const IconThemeData(
            color: Color(0xff1976D2)
          )
        ),
        home: const Splashscreen(),
      ),
    )
  );
}

