import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../theme/theme.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  final bool isDisabled;
  final VoidCallback? onTap;
  
  const LocationTile({
    Key? key,
    required this.location,
    this.isDisabled = false,
    this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: BlaSpacings.m,
          vertical: BlaSpacings.m,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: BlaColors.greyLight,  // Border color based on theme
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            // Location icon
            Icon(
              Icons.location_on_outlined,
              color: isDisabled ? BlaColors.disabled : BlaColors.primary,
            ),
            
            SizedBox(width: BlaSpacings.m),
            
            // Location details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // City name
                  Text(
                    location.name,
                    style: BlaTextStyles.body.copyWith(
                      color: isDisabled ? BlaColors.disabled : BlaColors.primary,
                    ),
                  ),
                  
                  SizedBox(height: BlaSpacings.s / 2),
                  
                  // Country name
                  Text(
                    location.country.name,
                    style: BlaTextStyles.body.copyWith(
                      color: isDisabled ? BlaColors.disabled : BlaColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            
            // Disabled indicator or selection icon
            if (isDisabled)
              Icon(
                Icons.block,
                color: BlaColors.disabled,
                size: 18,
              )
            else
              Icon(
                Icons.arrow_forward_ios,
                color: BlaColors.primary,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
