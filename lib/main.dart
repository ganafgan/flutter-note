import 'package:flutter/material.dart';
import 'package:flutter_note/pages/login_page.dart';
import 'package:flutter_note/utils/user_shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
