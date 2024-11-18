import 'package:flutter/material.dart';
import 'package:kon_khmer/W6-S1/EXERCISE-2/model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/w5-s2/aang.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+855 17 398 902"),
      TileData(icon: Icons.location_on, title: "Address", value: "Cambodia"),
      TileData(
          icon: Icons. email,
          title: "Mail",
          value: "panharanith.heng@student.cadt.edu.kh"),
    ]);
