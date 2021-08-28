import 'package:escribo_teste_02/controllers/cobras_escadas.dart';
import 'package:escribo_teste_02/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cobras e Escadas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => CobrasEscadas(),
        child: const Home(),
      ),
    );
  }
}
