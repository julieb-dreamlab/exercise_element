/// WholeCatalog ViewModel, derived from provider-shopper examples and
/// the Compass App architecture case study
import 'package:flutter/foundation.dart';

import '../utils/command.dart';
import '../utils/result.dart';
import '../repositories/exerercise_items.dart';
/// Whole Catalog ViewModel
///  
/// The catalog is expected to be immutable (no items are
/// expected to be added, removed or changed during the execution of the app).
/// But, since it is loading from external resources, use ChangeNotifier.
///
/// TODO: add logging
/// TODO: add catalogs by category( all, floor, standing)
class WholeCatalog extends ChangeNotifier {
  WholeCatalog({
    required ExerciseRepository exerciseRepository;
  }): _exerciseRepository = exerciseRepository {
    load = Command0(_load)..execute();
  };

  final ExerciseRepository _exerciseRepository;

  List<ExerciseItem> _exerciseItems = [];

  late Command0 load;

  UnmodifiableListView<ExerciseItem> get exercises => UnmodifiableListView(_exerciseItems);
  /// Get item by [id].
  ///
  /// Extract and List Exercises from [excersiceRows] which represents all exercise assets.
  ExerciseItem getById(int id) => ExerciseItem(id);

  /// Get item by its position in the catalog.
  ExerciseItem getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }

  /// Command to load the whole catalog of exercises
  Future<Result> _load() async {
    try {
      final result = await _exerciseRepository.getExercisesList();
      switch (result) {
        case Ok<List<ExerciseItem>>():
          _exerciseItems = result.value;
          // _log.fine('Loaded bookings');
        case Error<List<ExerciseItem>>():
          // _log.warning('Failed to load bookings', result.error);
          return result;
      }
      return result;
    } finally {
      notifyListeners();
    }
  }

}

