import 'package:favorite_app/controller/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text("No favorite yet"),
      );
    }

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("You have ${appState.favorites.length} favorites"),
            ),
            for (var pair in appState.favorites)
              GestureDetector(
                onTap: () {
                  appState.removeFavorite(pair);
                },
                child: ListTile(
                  mouseCursor: SystemMouseCursors.click,
                  leading: const Icon(Icons.favorite),
                  title: Text(pair.asLowerCase),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
