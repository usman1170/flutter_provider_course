// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/counter/provider/count_provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.time();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build under");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          print("build text");
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                "${value.dateTime.hour}:${value.dateTime.minute}:${value.dateTime.second}",
                style: const TextStyle(fontSize: 24),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
