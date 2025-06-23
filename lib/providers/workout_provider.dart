
import 'package:flutter/foundation.dart';
import '../models/workout.dart';

class WorkoutProvider extends ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(name: 'Push Ups', imageUrl: 'https://media.gettyimages.com/id/840909272/photo/athlete-doing-push-ups.jpg?s=612x612&w=gi&k=20&c=0-mMuJNZbfMomAXhNP9CsSwKOJqkBbXl7s6GiNXFYYw='),
    Workout(name: 'Squats', imageUrl: 'https://media.gettyimages.com/id/879709092/photo/woman-doing-squats-with-a-kettlebell.jpg?s=612x612&w=gi&k=20&c=0Ketdqe7wmwzyxaEPdkLSlgtW8DyhNvAGewF8wGU0qY='),
    Workout(name: 'Lunges', imageUrl: 'https://media.gettyimages.com/id/559688755/photo/gym-instructer-doing-lunges-with-kettlebells.jpg?s=612x612&w=gi&k=20&c=aB76I9b65mkLoQfdlBSYNNr8j4BY8DV_CqQ1AlAPubg='),
    Workout(name: 'Plank', imageUrl: 'https://media.gettyimages.com/id/642194490/photo/shes-at-the-gym-24-7.jpg?s=2048x2048&w=gi&k=20&c=KJsjy_GAJWlL9MUfRD_BJC9svkPd7ZGAQ5xAeHMGjFk='),
    Workout(name: 'Crunches', imageUrl: 'https://media.gettyimages.com/id/1223133121/photo/sweaty-black-athlete-doing-sit-ups-in-a-gym.jpg?s=2048x2048&w=gi&k=20&c=qErUVjCVuOBghchjGsEcK6uOrgvHPqTwgB2mLuC813E='),
    Workout(name: 'Dips', imageUrl: 'https://media.gettyimages.com/id/637401898/photo/man-working-out-triceps-dips-central-park.jpg?s=612x612&w=gi&k=20&c=LesAMtXTt6DLRKLX7F_5iPGC33HpV-MB0vogQMq2tBE='),
    Workout(name: 'Jumping Jacks', imageUrl: 'https://media.gettyimages.com/id/559688755/photo/gym-instructer-doing-lunges-with-kettlebells.jpg?s=612x612&w=gi&k=20&c=aB76I9b65mkLoQfdlBSYNNr8j4BY8DV_CqQ1AlAPubg='),
    Workout(name: 'Burpess', imageUrl: 'https://media.gettyimages.com/id/1388015612/photo/athletic-fitness-man-doing-burpee-exercise-fit-male-in-gym-exercise-outdoors-healthy.jpg?s=612x612&w=gi&k=20&c=YLB6XyoFTzqUsNe9G4DpqslvaMQ_0--8ofzsdKdWM_U='),
   
  ];

  List<Workout> get workouts => _workouts;

  List<Workout> get favorites => _workouts.where((w) => w.isFavorite).toList();

  void toggleFavorite(Workout workout) {
    workout.isFavorite = !workout.isFavorite;
    notifyListeners();
  }
}
