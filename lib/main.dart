import 'package:boiler_atn/counter/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('Build Widget');
    final counterBloc = CounterBloc();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Cool App")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Fetch Data"),
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: counterBloc.counterStream,
                  builder: (context, snapshot) {
                    return Text('Counter ${snapshot.data}');
                  }
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Increment);
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Decrement);
                },
                child: const Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Reset);
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
