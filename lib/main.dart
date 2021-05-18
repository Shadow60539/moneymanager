import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanager/models/category_Model.dart';
import 'package:moneymanager/views/homepage/homepage.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(CategoryModelAdapter());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyManager',
      theme: ThemeData.dark(),
      home: FutureBuilder(
          future: Hive.openBox("category"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else
                return HomePage();
            } else {
              return Scaffold();
            }
          }),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
