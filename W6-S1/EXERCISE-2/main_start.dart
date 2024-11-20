import 'package:flutter/material.dart';
import 'package:kon_khmer/W6-S1/EXERCISE-2/data/profile_data.dart';
import 'package:kon_khmer/W6-S1/EXERCISE-2/model/profile_tile_model.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileApp(
        profileData: nithProfile,
      ),
    ),
  );
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key, required this.profileData});

  final ProfileData profileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT Student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
            radius: 60,
            backgroundImage:
                AssetImage(profileData.avatarUrl ?? 'assets/default.png'),
          ),
          const SizedBox(height: 20),
          Text(
            profileData.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            profileData.position,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...profileData.tiles.map((tile) => ProfileTile(
                icon: tile.icon,
                title: tile.title,
                data: tile.value,
              )),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}

// Model for ProfileData
// class ProfileData {
//   final String name;
//   final String position;
//   final String? avatarUrl;
//   final List<TileData> titles;

//   const ProfileData({
//     required this.name,
//     required this.position,
//     this.avatarUrl,
//     required this.titles,
//   });
// }

// // Model for TileData
// class TileData {
//   final IconData icon;
//   final String title;
//   final String data;

//   const TileData({
//     required this.icon,
//     required this.title,
//     required this.data,
//   });
// }
