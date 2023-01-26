import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CounterModel>(
        builder: (context, counter, child) => Text(
          '${counter.value}',
          style: const TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}

class ProviderCounterApp extends StatelessWidget {
  const ProviderCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter"),
      ),
      body: const Counter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var counter = context.read<CounterModel>();
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProviderCounterScreen extends StatelessWidget {
  const ProviderCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (BuildContext context) => CounterModel(),
      child: const ProviderCounterApp(),
    );
  }
}
