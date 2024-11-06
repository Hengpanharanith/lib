import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 100,
              ),
              Container(
                color: const Color.fromARGB(255, 2, 23, 255),
                height: 300,
              ),
              Container(
                  child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.green,
                        height: 100,
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.pink,
                        height: 100,
                        width: 100,
                      )),
                ],
              )),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
