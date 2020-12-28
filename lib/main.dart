import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layouts/mobile_layout.dart';
import 'layouts/web_layout.dart';
import 'notifiers/self_identify_notifier.dart';
import 'pages/splash_screen.dart';

import './style.dart';
import './defaults.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyFscCertificationApp());
}

class MyFscCertificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) {
          return SplashScreen();
        }
        return ChangeNotifierProvider<SelfIdentifyEvaluationNotifier>.value(
          value: SelfIdentifyEvaluationNotifier(snapshot.data),
          child: AppBuilder(),
        );
      },
    );
  }
}

class AppBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: kHTheme,
      home: ResponsiveWebPage(),
    );
  }
}

class ResponsiveWebPage extends StatelessWidget {
  ResponsiveWebPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return (constraints.maxWidth <= 845) ? MobileLayout() : WebLayout();
    });
  }
}
