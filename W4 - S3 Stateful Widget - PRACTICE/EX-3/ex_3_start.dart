import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    // the line above is use use delete debug word at output when we run the code
    home: Center(
      child: ImagesGallery(),
    )));

class ImagesGallery extends StatefulWidget {
  const ImagesGallery({super.key});

  @override
  State<ImagesGallery> createState() => _ImagesGalleryState();
}

class _ImagesGalleryState extends State<ImagesGallery> {
  int currentIdex = 0;
  void nextImage() {
    setState(() {
      currentIdex = (currentIdex + 1) % images.length;
    });
  }

  void previousImage() {
    setState(() {
      currentIdex = (currentIdex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIdex]),
    );
  }
}
