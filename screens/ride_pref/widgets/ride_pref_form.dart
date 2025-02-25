import 'package:flutter/material.dart';
import 'package:your_project_name/model/ride/locations.dart';
import 'package:your_project_name/model/ride_pref/ride_pref.dart';

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController arrivalController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initRidePref != null) {
      departureController.text = widget.initRidePref!.departure.name;
      arrivalController.text = widget.initRidePref!.arrival.name;
      seatsController.text = widget.initRidePref!.requestedSeats.toString();
      selectedDate = widget.initRidePref!.departureDate;
    }
  }

  @override
  void dispose() {
    departureController.dispose();
    arrivalController.dispose();
    seatsController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (departureController.text.isEmpty ||
        arrivalController.text.isEmpty ||
        selectedDate == null ||
        seatsController.text.isEmpty) {
      return; // Show error message if needed
    }

    final ridePref = RidePref(
      departure:
          Location(name: departureController.text, country: Country.france),
      arrival: Location(name: arrivalController.text, country: Country.france),
      departureDate: selectedDate!,
      requestedSeats: int.tryParse(seatsController.text) ?? 1,
    );

    Navigator.pop(context, ridePref);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: departureController,
          decoration: InputDecoration(labelText: "Departure"),
        ),
        SizedBox(height: 10),
        TextField(
          controller: arrivalController,
          decoration: InputDecoration(labelText: "Arrival"),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => _pickDate(context),
          child: AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Departure Date",
                hintText: selectedDate != null
                    ? "${selectedDate!.toLocal()}".split(' ')[0]
                    : "Select Date",
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: seatsController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Requested Seats"),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text("Search"),
        ),
      ],
    );
  }
}
