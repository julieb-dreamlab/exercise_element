// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Structure derived from the Flutter Compass app

import 'dart:async';

import '../models/exercise.dart';
import '../utils/result.dart';
import '../services/local_data_service.dart';
import 'exercise_repository.dart';

class ExerciseRepositoryLocal implements ExerciseRepository {
  ExerciseRepositoryLocal({required LocalDataService localDataService})
    : _localDataService = localDataService;

  // Only create default exercise once
  bool _isInitialized = false;
  // Used to generate IDs for exercises
  int _sequentialId = 0;

  final _exercises = List<Exercise>.empty(growable: true);
  final LocalDataService _localDataService;

  @override
  Future<Result<void>> createExercise(Exercise exercise) async {
    // Exercises created come without id, we need to assign one
    final exerciseWithId = exercise.copyWith(id: _sequentialId++);
    _exercises.add(exerciseWithId);
    return const Result.ok(null);
  }

  @override
  Future<Result<Exercise>> getExercise(int id) async {
    final exercise = _exercises.where((exercise) => exercise.id == id).firstOrNull;
    if (exercise == null) {
      return Result.error(Exception('exercise not found'));
    }
    return Result.ok(exercise);
  }

  @override
  Future<Result<List<Exercise>>> getExercisesList() async {
    // Initialize the repository with a default exercise
    if (!_isInitialized) {
      await _createDefaultExercise();
      _isInitialized = true;
    }

    return Result.ok(_createExercises());
  }

  List<Exercise> _createExercises() {
    return _exercises
        .map(
          (exercise) => Exercise(
            id: exercise.id!,
            name: exercise.name, 
            icon: exercise.icon,
            text: exercise.text,
            seconds: exercise.seconds
          ),
        )
        .toList();
  }

  Future<void> _createDefaultExercise() async {
    // create a default exercise the first time
    if (_exercises.isEmpty) {
      // final name = (await _localDataService.getNames()).first;
      final id = 0;
      final name = (await _localDataService.getNameByRef(id));
      final icon = (await _localDataService.getIconByRef(id));
      final text = (await _localDataService.getTextByRef(id));
      final seconds = 30;
      _exercises.add(
        Exercise(
          id: _sequentialId++,
          name: name.first,
          icon: icon.first,
          text: text.first,
          seconds: seconds,
        ),
      );
    }
  }
}