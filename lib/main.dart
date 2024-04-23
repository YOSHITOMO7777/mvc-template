import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvc/view/counter_page.dart';
import 'package:mvc/controller/counter_controller.dart';
import 'package:mvc/model/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (_) => Counter()),
        ProxyProvider<Counter, CounterController>(
          update: (_, counter, __) => CounterController(counter),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterPage(),
      ),
    );
  }
}
