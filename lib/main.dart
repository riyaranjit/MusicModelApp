import 'package:flutter/material.dart';
import 'package:musicmodel/common/route/route_handler.dart';
import 'package:musicmodel/constants/route_strings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.black54),
          scaffoldBackgroundColor: Color.fromARGB(255, 48, 47, 47)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: RouteStrings.startupPage,
    );
  }
}
