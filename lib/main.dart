import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smstest/app/dependcy_injection.dart';
import 'package:smstest/app/resources/styles/theme_manager.dart';
import 'package:smstest/presentaion/routing/routes_manager.dart';
import 'package:smstest/presentaion/screens/home_screen.dart';
import 'package:smstest/presentaion/view_models/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => dependencyInjection<HomeViewModel>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: HomeScreen.id,
        theme: getApplicationTheme(),
      ),
    );
  }
}
