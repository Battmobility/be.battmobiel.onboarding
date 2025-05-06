// ignore_for_file: avoid_print

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/batt_onboarding.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:batt_auth/authentication/authentication.dart';
import 'package:batt_auth/authentication/domain/domain.dart';
import 'package:batt_auth/batt_auth.dart';
import 'package:batt_auth/l10n/auth_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await ThemeScopeWidget.initialize(const MyApp());
  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterSecureStorage storage;

  @override
  void initState() {
    super.initState();
    storage = FlutterSecureStorage(
        aOptions: const AndroidOptions(
      encryptedSharedPreferences: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Batt Onboarding",
      themeMode: ThemeMode.system,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      localizationsDelegates: [
        AuthLocalizations.delegate,
        OnboardingLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('nl'),
        Locale('fr'),
      ],
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: FutureBuilder(
                future: refreshedToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final token = snapshot.data;
                  if (token?.accessToken != null) {
                    return _formBody(context, token!.accessToken!);
                  } else {
                    print("No token found, logging in");
                    return _login(context, storage);
                  }
                },
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
        );
      }),
    );
  }

  Widget _login(BuildContext context, FlutterSecureStorage storage) {
    return LoginPage(onLogin: (token) {
      storage.write(key: "refreshToken", value: token.refreshToken!).then((_) {
        print("Token written to storage successfully");
        setState(() {});
      });
    }, onException: (error) {
      print("$error");
    });
  }

  Future<Accesstoken?> refreshedToken() async {
    final storedToken = await storage.read(key: "refreshToken");
    if (storedToken != null) {
      print("Token refreshed!");
      final refreshedToken = await refreshToken(storedToken);
      if (refreshedToken != null) {
        await storage.write(
            key: "refreshToken", value: refreshedToken.refreshToken!);
        return refreshedToken;
      }
    }
    print("No stored token found");
    return null;
  }

  Future<void> clearToken() async {
    await storage.delete(key: "refreshToken");
  }

  Widget _formBody(BuildContext context, String accessToken) =>
      OnboardingLandingForm(
        token: accessToken,
        onAuthenticationError: (_) => {},
        onSubmitted: (_) {
          clearToken().then((_) {
            setState(() {});
          });
        },
        onTrackEvent: (name, action, timeStamp, data) =>
            print("Tracking event: $name, $action, $timeStamp seconds, $data"),
        onTrackPageView: (name) => print(
          "Tracking page view: $name",
        ),
      );
}
