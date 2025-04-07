/// WholeCatalog ViewModel, derived from provider-shopper examples and
/// the Compass App architecture case study
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../utils/command.dart';
import '../utils/result.dart';
import '../models/exercise.dart';
import '../repositories/exercise_repository_local.dart';
/// Whole Catalog ViewModel
///  
/// The catalog is expected to be immutable (no items are
/// expected to be added, removed or changed during the execution of the app).
/// But, since it is loading from external resources, use ChangeNotifier.
///
/// TODO: add logging
/// TODO: add catalogs by category( all, floor, standing)
class WholeCatalog extends ChangeNotifier{
  final ExerciseRepositoryLocal exerciseRepository;
  WholeCatalog({
    required this.exerciseRepository, Key? key
  }): _exerciseRepository = exerciseRepository {
    load = Command0(_load)..execute();
  }

  final ExerciseRepositoryLocal _exerciseRepository;

  List<Exercise> _exercises = [];

  late final Command0 load;

  List<Exercise> get exercises => _exercises;

  int get length => _exercises.length;

  /// Get item by [id].
  ///
  /// Extract and List Exercises from [excersices] which represents all exercise assets.
  Exercise getById(int id) => exercises[id];

  /// Get item by its position in the catalog.
  Exercise getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }

  /// Command to load the whole catalog of exercises
  Future<Result> _load() async {
    try {
      final result = await _exerciseRepository.getExercisesList();
      switch (result) {
        case Ok<List<Exercise>>():
          _exercises = result.value;
          // _log.fine('Loaded bookings');
        case Error<List<Exercise>>():
          // _log.warning('Failed to load bookings', result.error);
          return result;
      }
      return result;
    } finally {
      notifyListeners();
    }
  }

}

