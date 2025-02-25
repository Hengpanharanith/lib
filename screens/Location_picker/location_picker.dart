import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';
import '../../service/locations_service.dart';
import '../../theme/theme.dart';
import 'widget/location_tile.dart';

class LocationPickerScreen extends StatefulWidget {
  final String title;
  final Location? excludeLocation;

  const LocationPickerScreen({
    Key? key,
    required this.title,
    this.excludeLocation,
  }) : super(key: key);

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  late List<Location> _locations;
  late List<Location> _filteredLocations;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _locations = LocationsService.getLocations();
    _filteredLocations = List.from(_locations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: BlaColors.primary,
        foregroundColor: BlaColors.white,
        elevation: 0,
      ),
      body: Center(
        child: _filteredLocations.isEmpty
            ? Text('No locations found')
            : ListView.builder(
                itemCount: _filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = _filteredLocations[index];
                  final isDisabled = widget.excludeLocation != null &&
                      location == widget.excludeLocation;

                  return LocationTile(
                    location: location,
                    isDisabled: isDisabled,
                    onTap: isDisabled ? null : () => _selectLocation(location),
                  );
                },
              ),
      ),
    );
  }

  void _selectLocation(Location location) {
    Navigator.of(context).pop(location);
  }
}
