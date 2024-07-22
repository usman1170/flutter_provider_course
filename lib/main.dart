// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/auth/screens/login.dart';
import 'package:provider_course/counter/provider/count_provider.dart';
import 'package:provider_course/favourites/provider/fev_provider.dart';
import 'package:provider_course/slider/provider/slider_provider.dart';
import 'package:provider_course/theme/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        print("Main build");
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
        );
      }),
    );
  }
}

class StateLessHomne extends StatelessWidget {
  StateLessHomne({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _pass = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("top build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateLess Home"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ValueListenableBuilder(
                valueListenable: _pass,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: _pass.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            _pass.value = !_pass.value;
                            print(_pass.value);
                          },
                          icon: Icon(
                            _pass.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      hintText: "Password",
                    ),
                  );
                }),
          ),
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                _counter.value.toString(),
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
