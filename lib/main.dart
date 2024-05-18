import 'package:budget_planer/Services/ExpensesContext.dart';
import 'package:budget_planer/Services/IDataContext.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'Widgets/SplitView.dart';

void main() async{

  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
    final gi = GetIt.instance;

    gi.registerSingletonAsync<IDataContext>(() async {
      final dbctx = ExpensesContext();
      await dbctx.init('Expenses.db');
      return dbctx;
    });

    await gi.allReady();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget planer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplitView();
  }
}
