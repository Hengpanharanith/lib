import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(),
            FavoriteCard(),
            FavoriteCard(),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  @override
  FavoriteCardState createState() => FavoriteCardState();
}

class FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  IconData get icon => isFavorite ? Icons.favorite : Icons.favorite_border;
  Color get color => isFavorite ? Colors.red : Colors.grey;

  // @override
  void click() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 5.0),
                Text('description')
              ],
            ),
          ),
          IconButton(
            onPressed: click,
            icon: Icon(icon),
            color: color,
          ),
        ],
      ),
    );
  }
}
