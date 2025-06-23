
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/workout_provider.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<WorkoutProvider>(context).favorites;

    if (favorites.isEmpty) {
      return const Center(child: Text("No favourites yet 😔"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final workout = favorites[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.network(workout.imageUrl, width: 60, fit: BoxFit.cover),
            title: Text(workout.name),
          ),
        );
      },
    );
  }
}
