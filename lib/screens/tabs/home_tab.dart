
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/workout_provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WorkoutProvider>(context);
    final workouts = provider.workouts;

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.network(workout.imageUrl, width: 60, fit: BoxFit.cover),
            title: Text(workout.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: IconButton(
              icon: Icon(
                workout.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: workout.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                provider.toggleFavorite(workout);
              },
            ),
          ),
        );
      },
    );
  }
}
