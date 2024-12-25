import 'package:flutter/material.dart';
import '../models/sensor_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List to hold the light control buttons with pin numbers and types
  List<LightControl> lightControls = [
    LightControl(name: 'Living Room Light', pin: 5, type: ButtonType.Light),
    LightControl(name: 'Bedroom Fan', pin: 6, type: ButtonType.Fan),
    LightControl(name: 'Kitchen AC', pin: 7, type: ButtonType.AirConditioner),
  ];

  // Add new light control button with pin number and type
  void _addLightControl() {
    TextEditingController nameController = TextEditingController();
    TextEditingController pinController = TextEditingController();
    ButtonType selectedButtonType = ButtonType.Light;
    String? nameError;
    String? pinError;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add New Light Control'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Input for light control name
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        errorText: nameError,
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    // Input for pin number
                    TextField(
                      controller: pinController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Pin Number',
                        errorText: pinError,
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    // Dropdown to select button type (Light, Fan, Air Conditioner)
                    DropdownButton<ButtonType>(
                      value: selectedButtonType,
                      onChanged: (ButtonType? newValue) {
                        setState(() {
                          selectedButtonType = newValue!;
                        });
                      },
                      items: ButtonType.values.map((ButtonType type) {
                        return DropdownMenuItem<ButtonType>(
                          value: type,
                          child: Text(type.toString().split('.').last,
                              style:
                                  TextStyle(fontSize: 18)), // Display type name
                        );
                      }).toList(),
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
                      pinError = (int.tryParse(pinController.text) ?? -1) <= 0
                          ? 'Please enter a valid positive pin number.'
                          : null;
                    });

                    if (nameError == null && pinError == null) {
                      int pin = int.tryParse(pinController.text) ?? -1;

                      // Check if the pin already exists
                      bool pinExists =
                          lightControls.any((control) => control.pin == pin);
                      if (!pinExists) {
                        setState(() {
                          // Add the new light control with name, pin number, and button type
                          lightControls.add(LightControl(
                            name: nameController.text,
                            pin: pin,
                            type: selectedButtonType,
                          ));
                        });
                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          pinError = 'Pin already exists!';
                        });
                      }
                    }
                  },
                  child: Text('Add', style: TextStyle(fontSize: 18)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel', style: TextStyle(fontSize: 18)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Edit the light control button name, pin number, and button type
  void _editLightControl(int index) {
    TextEditingController nameController =
        TextEditingController(text: lightControls[index].name);
    TextEditingController pinController =
        TextEditingController(text: lightControls[index].pin.toString());
    ButtonType selectedButtonType = lightControls[index].type;
    String? nameError;
    String? pinError;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Edit Light Control'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Input for light control name
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Edit Name',
                        errorText: nameError,
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    // Input for pin number
                    TextField(
                      controller: pinController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Edit Pin Number',
                        errorText: pinError,
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    // Dropdown to select button type (Light, Fan, Air Conditioner)
                    DropdownButton<ButtonType>(
                      value: selectedButtonType,
                      onChanged: (ButtonType? newValue) {
                        setState(() {
                          selectedButtonType = newValue!;
                        });
                      },
                      items: ButtonType.values.map((ButtonType type) {
                        return DropdownMenuItem<ButtonType>(
                          value: type,
                          child: Text(type.toString().split('.').last,
                              style:
                                  TextStyle(fontSize: 18)), // Display type name
                        );
                      }).toList(),
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
                      pinError = (int.tryParse(pinController.text) ?? -1) <= 0
                          ? 'Please enter a valid positive pin number.'
                          : null;
                    });

                    if (nameError == null && pinError == null) {
                      int pin = int.tryParse(pinController.text) ?? -1;

                      // Check if the pin already exists and is not the same as the current pin
                      bool pinExists = lightControls.any((control) =>
                          control.pin == pin &&
                          control != lightControls[index]);
                      if (!pinExists) {
                        setState(() {
                          // Update the name, pin number, and button type of the selected light control
                          lightControls[index].name = nameController.text;
                          lightControls[index].pin = pin;
                          lightControls[index].type = selectedButtonType;
                        });
                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          pinError = 'Pin already exists!';
                        });
                      }
                    }
                  },
                  child: Text('Save', style: TextStyle(fontSize: 18)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel', style: TextStyle(fontSize: 18)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Delete the light control button
  void _deleteLightControl(int index) {
    setState(() {
      lightControls.removeAt(index);
    });
  }

  // Refresh the light controls
  void _refreshLightControls() {
    setState(() {
      // Logic to refresh the light controls
      // For example, you can reload the data from a database or API
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light Control'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshLightControls,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Light Controls:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the number of items per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: lightControls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Logic to handle tapping the light control card
                    },
                    child: Card(
                      color: lightControls[index].isOn
                          ? Colors.green.shade200
                          : const Color.fromARGB(255, 255, 145, 145),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // Centered Value & Light Control Info
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  lightControls[index].type == ButtonType.Light
                                      ? Icons.lightbulb
                                      : lightControls[index].type ==
                                              ButtonType.Fan
                                          ? Icons.toys
                                          : Icons.ac_unit,
                                  size: 40,
                                  color: lightControls[index].isOn
                                      ? Colors.yellow.shade800
                                      : Colors.blue,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  lightControls[index].name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Pin: ${lightControls[index].pin}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: lightControls[index].isOn
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Text(
                                    lightControls[index].isOn ? 'ON' : 'OFF',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 50),
                                Transform.scale(
                                  scale: 2,
                                  child: Switch(
                                    value: lightControls[index].isOn,
                                    onChanged: (value) {
                                      setState(() {
                                        lightControls[index].isOn = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Edit Button
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              iconSize: 50,
                              onPressed: () => _editLightControl(index),
                            ),
                          ),
                          // Delete Button
                          Positioned(
                            top: 5,
                            left: 5,
                            child: IconButton(
                              icon: Icon(Icons.delete,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              iconSize: 50,
                              onPressed: () => _deleteLightControl(index),
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
        onPressed: _addLightControl,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
        tooltip: 'Add New Light Control',
      ),
    );
  }
}
