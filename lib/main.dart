import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_beet/recipe/providers/db.provider.dart';
import 'package:recipe_beet/recipe/providers/recipe.provider.dart';
import 'package:recipe_beet/recipe/providers/section.provider.dart';
import 'package:recipe_beet/recipe/recipe_list.page.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Create database
  final Database db = await initDb('data.db');

  // Create Singletons
  final RecipeProvider rp = RecipeProvider();
  final SectionProvider sp = SectionProvider();

  // Inject Database reference
  rp.db = db;
  sp.db = db;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
        ),
        home: const RecipeListPage());
  }
}
