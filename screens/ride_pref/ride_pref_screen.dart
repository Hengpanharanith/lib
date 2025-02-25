// import 'package:flutter/material.dart';
// import '../../model/ride_pref/ride_pref.dart';
// import '../../service/ride_prefs_service.dart';
// import '../../theme/theme.dart';
// import 'widgets/ride_pref_form.dart';
// import 'widgets/ride_pref_history_tile.dart';

// const String blablaHomeImagePath = 'assets/images/blabla_home.png';

// /// Ride Preferences Screen
// class RidePrefScreen extends StatefulWidget {
//   const RidePrefScreen({super.key});

//   @override
//   State<RidePrefScreen> createState() => _RidePrefScreenState();
// }

// class _RidePrefScreenState extends State<RidePrefScreen> {
//   void onRidePrefSelected(RidePref ridePref) {
//     // Navigate to the rides screen (with a bottom-to-top animation)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           /// Background Image
//           const Positioned.fill(child: BlaBackground()),

//           /// Foreground content with scrolling
//           Positioned.fill(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(height: 50), // Adjust top padding
//                     Text(
//                       "Your pick of rides at low price",
//                       style:
//                           BlaTextStyles.heading.copyWith(color: Colors.white),
//                     ),
//                     const SizedBox(height: 20),

//                     /// Ride Preferences Container
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Column(
//                         children: [
//                           /// Ride Preferences Form
//                           RidePrefForm(
//                               initRidePref: RidePrefService.currentRidePref),
//                           const SizedBox(height: 16),

//                           /// Past Preferences List
//                           SizedBox(
//                             height: 200,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: const BouncingScrollPhysics(),
//                               itemCount:
//                                   RidePrefService.ridePrefsHistory.length,
//                               itemBuilder: (ctx, index) {
//                                 return RidePrefHistoryTile(
//                                   ridePref:
//                                       RidePrefService.ridePrefsHistory[index],
//                                   onPressed: () => onRidePrefSelected(
//                                     RidePrefService.ridePrefsHistory[index],
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Background Image Widget
// class BlaBackground extends StatelessWidget {
//   const BlaBackground({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       blablaHomeImagePath,
//       width: double.infinity,
//       height: double.infinity,
//       fit: BoxFit.cover, // Ensures the image covers the screen
//     );
//   }
// }
import 'package:flutter/material.dart';

class RidesScreen extends StatelessWidget {
  final List<String> matchingRides;

  const RidesScreen({Key? key, required this.matchingRides}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matching Rides')),
      body: matchingRides.isEmpty
          ? const Center(child: Text('No rides found.'))
          : ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(matchingRides[index]),
                  onTap: () {
                    // Placeholder callback for tapping a ride
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: ${matchingRides[index]}')),
                    );
                  },
                );
              },
            ),
    );
  }
}

// Example usage:
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => RidesScreen(matchingRides: ['Ride 1', 'Ride 2'])));
