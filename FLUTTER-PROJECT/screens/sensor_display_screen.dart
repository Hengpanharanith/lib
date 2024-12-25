import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SensorDisplayScreen extends StatefulWidget {
  @override
  _SensorDisplayScreenState createState() => _SensorDisplayScreenState();
}

class _SensorDisplayScreenState extends State<SensorDisplayScreen> {
  List<Map<String, dynamic>> sensors = [
    {'type': 'Temperature', 'pin': 'A0', 'value': 22.0},
    {'type': 'Humidity', 'pin': 'A1', 'value': 60.0},
    {'type': 'Parking Slot', 'pin': 'A2', 'value': 3},
    {'type': 'Light Detector', 'pin': 'A4', 'value': 1},
  ];

  // Function to handle temperature/humidity/parking color coding
  Color _getSensorColor(double value, String type) {
    if (type == 'Temperature') {
      if (value < 20) return Colors.blue; // Cold
      if (value >= 20 && value <= 30) return Colors.green; // Normal
      return Colors.red; // Hot
    } else if (type == 'Humidity') {
      if (value < 30) return Colors.blue; // Low Humidity
      if (value >= 30 && value <= 60) return Colors.green; // Normal Humidity
      return Colors.red; // High Humidity
    } else if (type.startsWith('Parking Slot')) {
      if (value == 3) return Colors.green; // 3 slots available
      if (value == 2) return Colors.orange; // 2 slots available
      return Colors.red; // 1 slot available
    } else if (type == 'Light Detector') {
      if (value < 1) return Colors.grey; // Low light
      return Colors.yellow; // High light
    }
    return Colors.grey; // Default color
  }

  // Function to handle value changes for sensors
  void _updateSensorValue(int change, int index) {
    setState(() {
      double currentValue =
          double.tryParse(sensors[index]['value'].toString()) ?? 0.0;
      double newValue = currentValue + change;

      if (sensors[index]['type'] == 'Parking Slot') {
        if (newValue >= 0 && newValue <= 3) {
          sensors[index]['value'] = newValue;
        }
      } else if (sensors[index]['type'] == 'Count Sensor') {
        double maxValue = sensors[index]['maxValue'] ?? double.infinity;
        if (newValue >= 0 && newValue <= maxValue) {
          sensors[index]['value'] = newValue;
        }
      } else if (newValue >= 0) {
        sensors[index]['value'] = newValue;
      }
    });
  }

  // Function to delete a sensor
  void _deleteSensor(int index) {
    setState(() {
      sensors.removeAt(index);
    });
  }

  // Function to edit a sensor's type and pin
  void _editSensor(int index) {
    TextEditingController typeController =
        TextEditingController(text: sensors[index]['type']);
    TextEditingController pinController =
        TextEditingController(text: sensors[index]['pin']);
    String? typeError;
    String? pinError;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Edit Sensor"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: typeController,
                      decoration: InputDecoration(
                        hintText: "Enter sensor name",
                        errorText: typeError,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: pinController,
                      decoration: InputDecoration(
                        hintText: "Enter pin (e.g., A0, A1)",
                        errorText: pinError,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      typeError = typeController.text.isEmpty
                          ? 'Name cannot be empty.'
                          : null;
                      pinError = pinController.text.isEmpty
                          ? 'Pin cannot be empty.'
                          : null;
                    });

                    if (typeError == null && pinError == null) {
                      setState(() {
                        sensors[index]['type'] = typeController.text;
                        sensors[index]['pin'] = pinController.text;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Save"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Function to add a new sensor
  void _addSensor() {
    TextEditingController nameController = TextEditingController();
    TextEditingController pinController = TextEditingController();
    String? nameError;
    String? pinError;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Add Sensor"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter sensor name",
                        errorText: nameError,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: pinController,
                      decoration: InputDecoration(
                        hintText: "Enter pin (e.g., A0, A1)",
                        errorText: pinError,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      nameError = nameController.text.isEmpty
                          ? 'Name cannot be empty.'
                          : null;
                      pinError = pinController.text.isEmpty
                          ? 'Pin cannot be empty.'
                          : null;
                    });

                    if (nameError == null && pinError == null) {
                      setState(() {
                        String name = nameController.text;
                        String pin = pinController.text;

                        // Check if the pin already exists
                        bool pinExists =
                            sensors.any((sensor) => sensor['pin'] == pin);
                        if (!pinExists) {
                          sensors.add({
                            'type': name,
                            'pin': pin,
                            'value': 0.0,
                          });
                          Navigator.pop(context);
                        } else {
                          pinError = 'Pin already exists!';
                        }
                      });
                    }
                  },
                  child: Text("Add"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Function to refresh the screen
  void _refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Display'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshScreen,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Sensors:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the number of items per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: sensors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Logic to handle tapping the sensor card
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 178, 178, 178),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // Centered Value & Sensor Info
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  sensors[index]['type'] == 'Temperature'
                                      ? Icons.thermostat_outlined
                                      : sensors[index]['type'] == 'Humidity'
                                          ? Icons.water_damage_outlined
                                          : sensors[index]['type'] ==
                                                  'Parking Slot'
                                              ? Icons.local_parking
                                              : Icons.device_thermostat,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  sensors[index]['type']!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Pin: ${sensors[index]['pin']}',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: _getSensorColor(
                                        double.tryParse(sensors[index]['value']
                                                .toString()) ??
                                            0.0,
                                        sensors[index]['type']!),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '${sensors[index]['value']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 5,
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: () => _updateSensorValue(1, index),
                            ),
                          ),
                          // Minus button at the top-right
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              icon: Icon(Icons.remove, color: Colors.white),
                              onPressed: () => _updateSensorValue(-1, index),
                            ),
                          ),
                          // Edit button at the bottom-left
                          Positioned(
                            bottom: 5,
                            left: 5,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () => _editSensor(index),
                            ),
                          ),
                          // Delete button at the bottom-right
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.white),
                              onPressed: () => _deleteSensor(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSensor,
        child: Icon(Icons.add),
      ),
    );
  }
}
