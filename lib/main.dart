import 'package:flutter/material.dart';
import 'package:state_man/state_managements/change_notifier_state_management.dart';
import 'package:state_man/state_managements/stream_state_management.dart';
import 'package:state_man/state_managements/value_notifier.dart';

void main() {
  runApp(const MyApp());
}

final changeNotifierStateManagement = ChangeNotifierStateManagement();
final streamStateManagement = StreamStateManagement();
final valueNotifierStateManagement = ValueNotifierStateManagement();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  int _setStateCounter = 0;

  void _incrementCounter() {
    setState(() {
      _setStateCounter++;
    });
  }

  void _incrementStreamCounter() => streamStateManagement.incrementCounter();

  void _incrementChangeNotifierCounter() =>
      changeNotifierStateManagement.incrementCounter();

  void _incrementValueNotifierCounter() =>
      valueNotifierStateManagement.incrementCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                // setState
                Column(
                  children: [
                    const Text(
                      'setState - Counter',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: _incrementCounter,
                        icon: const Icon(Icons.add)),
                    Text(
                      '$_setStateCounter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                // Change Notifier
                Column(
                  children: [
                    const Text(
                      'Change Notifier - Counter',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: _incrementChangeNotifierCounter,
                        icon: const Icon(Icons.add)),
                    ListenableBuilder(
                      listenable: changeNotifierStateManagement,
                      builder: (context, _) {
                        return Text(
                          '${changeNotifierStateManagement.counter}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                // Value Notifier
                Column(
                  children: [
                    const Text(
                      'Value Notifier - Counter',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: _incrementValueNotifierCounter,
                        icon: const Icon(Icons.add)),
                    ValueListenableBuilder(
                      valueListenable: valueNotifierStateManagement.counter,
                      builder: (context, int counter, _) {
                        return Text(
                          '$counter',
                          style: Theme.of(context).textTheme.headlineMedium,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                // Streams
                Column(
                  children: [
                    const Text(
                      'Streams - Counter',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: _incrementStreamCounter,
                        icon: const Icon(Icons.add)),
                    StreamBuilder(
                      stream: streamStateManagement.counter,
                      builder: (context, AsyncSnapshot<int> couterSnapshot) {
                        return Text(
                          '${couterSnapshot.data}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
