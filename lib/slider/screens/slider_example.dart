// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/slider/provider/slider_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    final expProvider = Provider.of<SliderProvider>(context, listen: false);
    print("build under");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Consumer<SliderProvider>(
            builder: (context, valu, child) {
              return Slider(
                  value: valu.val,
                  onChanged: (value) {
                    valu.setValue(value);
                  });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(expProvider.val)),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(expProvider.val)),
                      child: const Center(
                        child: Text("Container 2"),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
