import 'package:flutter/material.dart';
import 'button_display_screen.dart';
import 'sensor_display_screen.dart';
import '../models/sensor_model.dart';

// Model for Button data

class AllControlsScreen extends StatefulWidget {
  @override
  _AllControlsScreenState createState() => _AllControlsScreenState();
}

class _AllControlsScreenState extends State<AllControlsScreen> {
  // List to hold the button data
  List<ButtonData> buttons = [
    ButtonData(
        title: "Light Control", screen: HomeScreen(), icon: Icons.lightbulb),
    ButtonData(
        title: "Sensor Display",
        screen: SensorDisplayScreen(),
        icon: Icons.thermostat),
  ];

  // Add new button to the list

  // Edit the button title
  void _editButton(int index) {
    TextEditingController titleController =
        TextEditingController(text: buttons[index].title);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Button'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Edit Button Title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    buttons[index].title = titleController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Delete a button
  void _deleteButton(int index) {
    setState(() {
      buttons.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Home Control'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                leading: Icon(
                  buttons[index].icon,
                  size: 40,
                  color: Colors.teal,
                ),
                title: Text(
                  buttons[index].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                tileColor: Colors.teal.shade50,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Edit Button
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _editButton(index),
                    ),
                    // Delete Button
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteButton(index),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => buttons[index].screen),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
