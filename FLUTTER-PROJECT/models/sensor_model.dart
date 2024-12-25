import 'package:flutter/material.dart';

enum ButtonType { Light, Fan, AirConditioner }

class Sensor {
  String type;
  String pin;
  double value;

  Sensor({required this.type, required this.pin, required this.value});

  factory Sensor.fromMap(Map<String, dynamic> map) {
    return Sensor(
      type: map['type'] ?? '',
      pin: map['pin'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
    );
  }

  // Method to convert a Sensor object to a Map
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'pin': pin,
      'value': value,
    };
  }
}

class ButtonData {
  String title;
  Widget screen;
  IconData icon; // Add an icon to the button
  ButtonData({required this.title, required this.screen, required this.icon});
}

class LightControl {
  String name;
  int pin;
  ButtonType type;
  bool isOn; // State to represent on/off

  LightControl(
      {required this.name,
      required this.pin,
      required this.type,
      this.isOn = false});
}
