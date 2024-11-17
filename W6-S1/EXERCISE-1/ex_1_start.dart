import 'package:flutter/material.dart';

// answer to the question Q1
// - Integrating the Loop Directly we can see code clearly easy to understand the same as other language but it a little confuse when the list is change .
// - Using the map() Method when the list is change the code map is flexible easy to control then using manual loop
// - Using a Dedicated Function its good for reused function the code more organize

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for (var color in colors)
              Text(color, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            const Label("Method 2: Map", bold: true),
            ...colors
                .map((color) =>
                    Text(color, style: const TextStyle(fontSize: 16)))
                .toList(),
            const SizedBox(height: 30),
            const Label("Method 3: Dedicated Function", bold: true),
            ...listcolors(colors),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

// List of colors
List<String> colors = ["red", "blue", "green"];

// Dedicated function to build the list of widgets
List<Widget> listcolors(List<String> colors) {
  return colors
      .map((color) => Text(color, style: const TextStyle(fontSize: 16)))
      .toList();
}// Deducated function 
