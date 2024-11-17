import 'package:flutter/material.dart';
import 'jokes.dart';

Color appColor = const Color.fromARGB(255, 255, 0, 140) as Color;

void main() {
  runApp(const JokesApp());
}

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: const JokesList(),
      ),
    );
  }
}

class JokesList extends StatefulWidget {
  const JokesList({super.key});

  @override
  State<JokesList> createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  int? _currentFavoriteIndex;

  void _setFavorite(int index) {
    setState(() {
      _currentFavoriteIndex = (_currentFavoriteIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        final joke = jokes[index];
        return FavoriteCard(
          title: joke.title,
          content: joke.content,
          isFavorite: _currentFavoriteIndex == index,
          onFavoriteSelected: () => _setFavorite(index),
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String content;
  final bool isFavorite;
  final VoidCallback onFavoriteSelected;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.content,
    required this.isFavorite,
    required this.onFavoriteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(content),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteSelected,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
