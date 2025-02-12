import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/batt_onboarding.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';
import 'package:dart_auth/authentication/authentication.dart';
import 'package:dart_auth/authentication/domain/domain.dart';
import 'package:dart_auth/dart_auth.dart';
import 'package:dart_auth/l10n/auth_localizations.dart';
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
  Accesstoken? _accessToken;
  @override
  Widget build(BuildContext context) {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    final storage = FlutterSecureStorage(aOptions: getAndroidOptions());

    return MaterialApp(
      title: 'Flutter Demo',
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
                future: storage.read(key: "refreshToken"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final token = snapshot.data;
                  if (token != null) {
                    return _tokenRefreshBody(context, token, storage);
                  } else if (_accessToken?.refreshToken != null) {
                    return _tokenRefreshBody(
                        context, _accessToken!.refreshToken!, storage);
                  } else {
                    return _login(context, storage);
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _login(BuildContext context, FlutterSecureStorage storage) {
    return LoginPage(onLogin: (token) {
      storage.write(key: "refreshToken", value: token.refreshToken!);
      setState(() {
        _accessToken = token;
      });
    }, onException: (error) {
      print("$error");
    });
  }

  Widget _tokenRefreshBody(
      BuildContext context, String token, FlutterSecureStorage storage) {
    return FutureBuilder(
        future: refreshToken(token),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final refreshedToken = snapshot.data;
          if (refreshedToken != null && refreshedToken.accessToken != null) {
            storage.write(
                key: "refreshToken", value: refreshedToken.refreshToken!);
            _accessToken = refreshedToken;
            return _formBody(context, refreshedToken.accessToken!);
          } else {
            return _login(context, storage);
          }
        });
  }

  Widget _formBody(BuildContext context, String accessToken) =>
      OnboardingLandingForm(
        accessToken: accessToken,
        onAuthenticationError: (_) => {},
        onStepStarted: (_) => {},
        onStepCompleted: (_) => {},
        onSubmitted: (_) => {},
      );
}
