import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen_signup/Provider/statesFormSignUp_Provider.dart';
import 'package:screen_signup/Routes/routes_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => StateTextForm()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: appRoutes,
        initialRoute: 'signUp',
      ),
    );
  }
}
