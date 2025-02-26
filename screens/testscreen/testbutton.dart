import 'package:flutter/material.dart';

import 'package:your_project_name/theme/theme.dart';
import 'package:your_project_name/widgets/actions/blabtn.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlaButton(
                label: 'Bla 1',
                style: BlaButtonStyle.outlined,
                icon: const Icon(Icons.messenger_outline),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              BlaButton(
                label: 'Bla 2',
                style: BlaButtonStyle.filled,
                icon: const Icon(Icons.calendar_month_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
