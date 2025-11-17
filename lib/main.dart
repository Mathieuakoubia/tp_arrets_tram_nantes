import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_liste_course/providers/arret_provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArretProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Arrêts de métro de Nantes'),
      ),
    );
  }
}
