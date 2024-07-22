// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/theme/provider/theme_provider.dart';

class ThemeHomeScreem extends StatefulWidget {
  const ThemeHomeScreem({super.key});

  @override
  State<ThemeHomeScreem> createState() => _ThemeHomeScreemState();
}

class _ThemeHomeScreemState extends State<ThemeHomeScreem> {
  @override
  Widget build(BuildContext context) {
    print("Upper build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ThemeProvider>(builder: (context, value, c) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RadioListTile<ThemeMode>(
                title: const Text("Light Theme"),
                value: ThemeMode.light,
                groupValue: value.themeMode,
                onChanged: value.setThemeMode,
              ),
              RadioListTile<ThemeMode>(
                title: const Text("Dark Theme"),
                value: ThemeMode.dark,
                groupValue: value.themeMode,
                onChanged: value.setThemeMode,
              ),
              RadioListTile<ThemeMode>(
                title: const Text("System Theme"),
                value: ThemeMode.system,
                groupValue: value.themeMode,
                onChanged: value.setThemeMode,
              ),
            ],
          );
        }),
      ),
    );
  }
}
